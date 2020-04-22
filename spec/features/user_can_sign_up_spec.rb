feature 'user can sign up' do
    describe 'user can create an account' do
        before do
            visit root_path
            click_on "Sign up"
            fill_in "Name", with: "Bobert"
            fill_in "Email", with: "bob@bobert.com"
            fill_in "Password", with: "qwerty123"
            fill_in "Password confirmation", with: "qwerty123"
            click_on "Create"
        end
    
        it 'user can fill form and submit' do
            expect(page).to have_content "You have signed up successfully"
        end
    end

    describe 'user gets informative error messages' do
        before do
            visit root_path
            click_on "Sign up"
            fill_in "Email", with: "bob@bobert.com"
            fill_in "Password", with: "qwerty123"
        end

        it 'should give an error no name is given' do
            fill_in "Password confirmation", with: "qwerty123"
            click_on "Create"
            expect(page).to have_content "Name can't be blank"
        end

        it 'should give an error if passwords dont match' do
            fill_in "Name", with: "Bobby"
            fill_in "Password confirmation", with: "qwerty124"
            click_on "Create"
            expect(page).to have_content "Password confirmation doesn't match Password"
        end
    end 

    describe "user can't sign up twice" do 
        before do 
            visit root_path
            click_on "Sign up"
            fill_in "Name", with: "Bobert"
            fill_in "Email", with: "bob@bobert.com"
            fill_in "Password", with: "qwerty123"
            fill_in "Password confirmation", with: "qwerty123"
            click_on "Create"
            click_on "Logout"
            click_on "Sign up"
            fill_in "Name", with: "Bobert"
            fill_in "Email", with: "bob@bobert.com"
            fill_in "Password", with: "qwerty123"
            fill_in "Password confirmation", with: "qwerty123"
            click_on "Create"
        end

        it "should give an error when name is taken" do
            expect(page).to have_content "Name has already been taken"
        end
    end
end