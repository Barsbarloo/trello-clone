require "rails_helper"

RSpec.describe List, type: :model do
  it { is_expected.to belong_to :board }
end
