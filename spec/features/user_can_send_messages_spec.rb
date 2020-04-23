feature "user can send messages" do 
    let(:sender) {create(:user, email: 'sender@mail.com', password:'wderfhujikki', name:'pauline') }
    let(:receiver) {create(:user, email: 'receiver@mail.com',password:' hdjkkkklkk', name:'ali') }
     describe "sender logs-in and sends message" do 
     
     before do
        
          login_as(sender, scope: :user)
          visit root_path
          click_on "Inbox"
          click_on "Compose"
          select "ali", from: "Recipients"
          fill_in "Subject", with: "Bonjour"
          fill_in "Message", with: "Blablalal"
          click_on "Send Message"
          
        end
        
        it "receives success message" do 
          expect(page).to have_content "Your message was successfully sent!"
        
        end
    end


end