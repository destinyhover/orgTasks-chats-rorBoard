
require 'rails_helper'

RSpec.describe Contact, type: :model do
 describe "validations" do 
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:text) }
  end

end
