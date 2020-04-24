feature "User can trash messages" do 
    let(:sender) {create(:user, email: "sender@mail.com", password:"wderfhujikki", name:"pauline") }
    let(:receiver) {create(:user, email: "receiver@mail.com",password:"hdjkkkklkk", name:"ali") }

    describe "sender sends message and receivers logs in and deletes it" do  
        before do
            abc =sender.send_message(receiver, "Lorem ipsum...", "Subject")
            puts abc
            login_as(receiver, scope: :user)
            visit conversation_path(abc.notification_id)
            click_on "Move to trash"        
        end
        
        it "receiver checks inbox" do
            expect(page).to_not have_content "Lorem ipsum..."
        end
    end
end 