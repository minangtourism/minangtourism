class DeletionRequest < ActiveRecord::Base
  belongs_to :item, polymorphic: true
  belongs_to :user

  attr_accessible :item, :reason, :state, as: [:default] + User.valid_roles
  validates :item_id, :item_type, :user_id, presence: true
  validates :user_id, uniqueness: {scope: [:item_id, :item_type, :state], message: 'has another pending deletion request for the item'}

  state_machine initial: :pending do
    after_transition any => :approved, :do => :destroy_item, :if => :item

    event :approve do
      transition :pending => :approved
    end

    event :reject do
      transition :pending => :rejected
    end

    state :approved
    state :pending
    state :rejected
  end

  def state_enum
    self.class.state_machine.states.map do |state|
      [state.name.to_s.humanize, state.value.to_s]
    end
  end

  protected

  def destroy_item
    item.destroy
  end
end
