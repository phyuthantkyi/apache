describe User do

  before(:each) { @user = User.new(email: 'cloudsource@gmail.com') }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'cloudsource@gmail.com'
  end

end
