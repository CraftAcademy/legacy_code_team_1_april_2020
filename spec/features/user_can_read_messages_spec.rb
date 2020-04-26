feature "User can read messages" do 
    let(:sender) {create(:user, email: "sender@mail.com", password:"wderfhujikki", name:"pauline") }
    let(:receiver) {create(:user, email: "receiver@mail.com",password:"hdjkkkklkk", name:"ali") }

    describe "sender sends message and user logs in" do  
        before do
            sender.send_message(receiver, "Lorem ipsum...", "Subject")
            login_as(receiver, scope: :user)
            visit mailbox_inbox_path
        end

        it "receiver checks inbox" do
            expect(page).to have_content "Lorem ipsum..."
        end
    end

    describe "sender checks sent" do 
        before do
            sender.send_message(receiver, "Lorem ipsum...", "Subject")
            login_as(sender, scope: :user)
            visit mailbox_sent_path
        end

        it "sentbox has the message" do
            expect(page).to have_content "Lorem ipsum..."  
        end
    end
end 