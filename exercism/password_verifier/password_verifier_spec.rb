require 'rspec'
require_relative 'password_verifier'

describe 'Password Verifier Behavior' do
  before do
    @verifier = PasswordVerifier.new()
  end

  it "verifies password is longer than 8 chars" do
    expect{@verifier.verify("password")}.to raise_error(RuntimeError, 'Password must be longer than 8 chars.')
  end

  it "verifies password is not null" do
    expect{@verifier.verify(nil)}.to raise_error(RuntimeError, 'Password must be present.')
  end

  it "verifies password has one upper case letter" do
    expect{@verifier.verify("password123")}.to raise_error(RuntimeError, 'Password must have one upper case letter.')
  end

  it "verifies password has one lower case letter" do
    expect{@verifier.verify("PASSWORD123")}.to raise_error(RuntimeError, 'Password must have one lower case letter.')
  end

  it "verifies password has one number" do
    expect{@verifier.verify("PaSSWORDPLZ")}.to raise_error(RuntimeError, 'Password must have at least one number.')
  end
end
