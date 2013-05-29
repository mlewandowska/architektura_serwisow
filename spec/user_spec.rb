require 'spec_helper'

describe User do

  before { @user = User.new(email: "user@example.com",) }

  subject { @user }

  it { should respond_to(:email) }
it { should_not respond_to(:name) }
end
