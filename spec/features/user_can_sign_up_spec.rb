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
        expect(page).to have_content "User signed up successfully"
    end


end