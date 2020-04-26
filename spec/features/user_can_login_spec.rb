feature "User can login" do
   let(:user) { create(:user) }

    describe "on the login the page" do
       before do
           visit root_path
           click_on "Login"
       end
       
       describe "with correct parameters" do
           before do
            fill_in "Email", with: user.email
            fill_in "Password", with: user.password
            click_on "Log in"
           end

           it "user logs in" do
               expect(page).to have_content "Hello, #{user.name}"
           end
       end

       describe "with wrong password" do
           before do
            fill_in "Email", with: user.email
            fill_in "Password", with: "password123"
            click_on "Log in"
           end

           it "user can't login" do
            expect(page).to have_content "Invalid Email or password"
           end
       end

       describe "with wrong email" do
            before do
              fill_in "Email", with: "Donald@potus.com"
              fill_in "Password", with: user.password
              click_on "Log in"
            end

            it "user can't login" do
              expect(page).to have_content "Invalid Email or password"
            end
        end

        describe "and log out" do
            before do
                login_as(user, scope: :user)
                visit root_path
            end

            it "has logout button" do
                expect(page).to have_content "Logout"
            end

            it "destroys session" do
                click_on "Logout"
                expect(page).to have_content "Login"
            end
        end
    end
end