feature 'user can sign up' do
    before do
        visit root_path
        click_on "Sign up"
    end

    it 'should have a signup form' do
        expect(page).to have_content "Sign up"
        expect(page).to have_content "Password"
    end

    it 'user can fill form and submit' do
        fill_in "Name", with: "Bobert"
        fill_in "Email", with: "bob@bobert.com"
        fill_in "Password", with: "qwerty123"
        fill_in "Password confirmation", with: "qwerty123"
        click_on "Create"
        expect(page).to have_content "You have signed up successfully"
    end

    it 'should give an error no name is given' do
        fill_in "Email", with: "bob@bobert.com"
        fill_in "Password", with: "qwerty123"
        fill_in "Password confirmation", with: "qwerty123"
        click_on "Create"
        expect(page).to have_content "Name can't be blank"
    end

    it 'should give an error if passwords dont match' do
        fill_in "Name", with: "Bobby"
        fill_in "Email", with: "bob@bobert.com"
        fill_in "Password", with: "qwerty123"
        fill_in "Password confirmation", with: "qwerty124"
        click_on "Create"
        expect(page).to have_content "Password confirmation doesn't match Password"
    end

    it 'does not allow duplicate signups' do
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
        expect(page).to have_content "Name has already been taken"
    end 
end