feature "User can read messages" do 
    let(:sender) {create(:user, email: "sender@mail.com", password:"wderfhujikki", name:"pauline") }
    let(:receiver) {create(:user, email: "receiver@mail.com",password:"hdjkkkklkk", name:"ali") }

    describe "sender sends message and user logs in" do 
        before do
            sender.send_message(receiver, "Lorem ipsum...", "Subject")
            login_as(receiver, scope: :user)
            visit root_path
            click_on "Inbox"
            click_on "View"
        end

        it "receiver checks inbox" do
            expect(page).to have_content "Lorem ipsum..."
        end       
    end
end 