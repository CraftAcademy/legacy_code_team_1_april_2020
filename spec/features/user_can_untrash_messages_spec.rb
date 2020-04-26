feature "User can untrash messages" do 
    let(:sender) {create(:user, email: "sender@mail.com", password:"wderfhujikki", name:"pauline") }
    let(:receiver) {create(:user, email: "receiver@mail.com",password:"hdjkkkklkk", name:"ali") }
    
    describe "sender sends message and receivers logs in and deletes it" do  
        before do
            @message = sender.send_message(receiver, "Lorem ipsum...", "Subject")
            login_as(receiver, scope: :user)
            visit conversation_path(@message.notification_id)
            click_on "Move to trash"       
        end

        it "receiver checks trash and untrashes the message" do
            visit conversation_path(@message.notification_id)
            click_on "Untrash"
            visit mailbox_inbox_path
            expect(page).to have_content "Lorem ipsum..."
        end
    end
end  