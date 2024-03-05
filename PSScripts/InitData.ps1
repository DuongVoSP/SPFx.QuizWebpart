###Setup site
$siteUrl = "https://upheadsdeveloper.sharepoint.com/sites/StaffManagement"
Connect-PnPOnline -url $siteUrl -UseWebLogin
##**Departments**: define **Location**, **Office Manager**, **Introduce the office**
$questionListTitle = "Cyber Security Questions"

$questionList = Get-PnPList -Identity $questionListTitle
Add-PnPListItem -List $questionList -Values @{
    "Title"         = "Question 1"; 
    "type"          = "Choice"; 
    "question"      = '<div>What is phishing?</div>'; 
    "options"       = 'A deep-sea fishing technique;#A fraudulent attempt to obtain sensitive information;#A popular social media platform;#A type of computer virus';
    "correctAnswer" = 'A fraudulent attempt to obtain sensitive information';
    "disabled"      = $false;
}

Add-PnPListItem -List $questionList -Values @{
    "Title"         = "Question 2"; 
    "type"          = "Choice"; 
    "question"      = '<div>Which of the following is a common phishing method?</div>'; 
    "options"       = 'Sending physical letters;#Social engineering;#Installing antivirus software;#Performing system updates';
    "correctAnswer" = 'Social engineering';
    "disabled"      = $false;
}

Add-PnPListItem -List $questionList -Values @{
    "Title"         = "Question 3"; 
    "type"          = "Choice"; 
    "question"      = '<div>What is the purpose of a phishing email?</div>'; 
    "options"       = 'To share funny memes;#To spread awareness about cyber threats;#To trick recipients into revealing personal information;#To promote online shopping deals';
    "correctAnswer" = 'To trick recipients into revealing personal information';
    "disabled"      = $false;
}

Add-PnPListItem -List $questionList -Values @{
    "Title"         = "Question 4"; 
    "type"          = "Choice"; 
    "question"      = '<div>How can you identify a phishing email?</div>'; 
    "options"       = 'The email has a catchy subject line;#The email contains urgent requests for personal information;#The email is sent from a known colleague;#The email has colorful graphics and emojis';
    "correctAnswer" = 'The email contains urgent requests for personal information';
    "disabled"      = $false;
}
Add-PnPListItem -List $questionList -Values @{
    "Title"         = "Question 5"; 
    "type"          = "Choice"; 
    "question"      = '<div>What is two-factor authentication (2FA) used for?</div>'; 
    "options"       = 'To create strong passwords;#To identify phishing attempts;#To provide an additional layer of security;#To encrypt email messages';
    "correctAnswer" = 'To provide an additional layer of security';
    "disabled"      = $false;
}

Add-PnPListItem -List $questionList -Values @{
    "Title"         = "Question 6"; 
    "type"          = "MultiChoice"; 
    "question"      = '<div>What are potential signs of a phishing email? (Select all that apply)</div>'; 
    "options"       = 'Generic greetings (e.g., "Dear User");#Urgent requests for personal information;#Misspelled words and poor grammar;#Links that lead to official company websites;#Attachments from known contacts';
    "correctAnswer" = 'Generic greetings (e.g., "Dear User");#Urgent requests for personal information;#Misspelled words and poor grammar';
    "disabled"      = $false;
}

Add-PnPListItem -List $questionList -Values @{
    "Title"         = "Question 7"; 
    "type"          = "MultiChoice"; 
    "question"      = '<div>Which actions can help you avoid falling victim to phishing attacks? (Select all that apply)</div>'; 
    "options"       = 'Regularly update your antivirus software;#Disable spam filters to receive all emails;#Verify the sender"s email address;#Click on links without verifying them;#Enable two-factor authentication (2FA)';
    "correctAnswer" = 'Regularly update your antivirus software;#Verify the sender"s email address;#Enable two-factor authentication (2FA)';
    "disabled"      = $false;
}

Add-PnPListItem -List $questionList -Values @{
    "Title"         = "Question 8"; 
    "type"          = "MultiChoice"; 
    "question"      = '<div>What should you do if you receive a suspicious link from a colleague? (Select all that apply)</div>'; 
    "options"       = 'Click on the link to see where it leads;#Ask your colleague directly if they sent the link;#Report the email to your IT department;#Share the link on social media for awareness;#Forward the email to other colleagues';
    "correctAnswer" = 'Ask your colleague directly if they sent the link;#Report the email to your IT department';
    "disabled"      = $false;
}

