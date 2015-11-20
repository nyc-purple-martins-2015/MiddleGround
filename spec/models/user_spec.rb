require 'rails_helper'

RSpec.describe User do

  it { is_expected.to validate_presence_of :username }
  it { is_expected.to validate_presence_of :password }
  it { is_expected.to validate_presence_of :email }

end