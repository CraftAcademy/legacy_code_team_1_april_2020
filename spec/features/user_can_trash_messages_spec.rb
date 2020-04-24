feature "User can trash messages" do 
    let(:sender) {create(:user, email: "sender@mail.com", password:"wderfhujikki", name:"pauline") }
    let(:receiver) {create(:user, email: "receiver@mail.com",password:"hdjkkkklkk", name:"ali") }

    describe "sender sends message and receivers logs in and deletes it" do  

        before do
            sender.send_message(receiver, "Lorem ipsum...", "Subject")
            login_as(receiver, scope: :user)
            visit root_path
            click_on "Inbox"
            click_on "View"
            click_on "Move to trash"        
        end
        
        it "receiver checks inbox" do
            expect(page).to_not have_content "Are you sure?"
        end

    end
end 