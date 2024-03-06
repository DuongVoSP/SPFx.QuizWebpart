###Setup site
$siteUrl = "https://upheadsdeveloper.sharepoint.com/sites/StaffManagement"
Connect-PnPOnline -url $siteUrl -UseWebLogin

#####Setup Lists#######
##**Questions**
$questionListTitle = "Cyber Security Questions"
New-PnPList -Title $questionListTitle -Url "lists/CyberSecurityQuestions" -Template GenericList 

$questionList = Get-PnPList -Identity $questionListTitle
Set-PnPField -List $questionList -Identity "Title" -Values @{ Title = "Name" }
Add-PnPField -List $questionList -DisplayName "Type" -InternalName "type" -Type Choice -Choices "Choice", "MultiChoice", "Freetext", "Arrange" -AddToDefaultView
Add-PnPField -List $questionList -DisplayName "Question" -InternalName "question" -Type Note -AddToDefaultView
Add-PnPField -List $questionList -DisplayName "Options" -InternalName "options" -Type Note 
Add-PnPField -List $questionList -DisplayName "CorrectAnswer" -InternalName "correctAnswer" -Type Note
Add-PnPField -List $questionList -DisplayName "Disabled" -InternalName "disabled" -Type Boolean

##**User Data**
$responseUserDataTitle = "Response User Data"
New-PnPList -Title $responseUserDataTitle -Url "lists/ResponseUserData" -Template GenericList 

$responseUserDataList = Get-PnPList -Identity $responseUserDataTitle
Set-PnPField -List $responseUserDataList -Identity "Title" -Values @{ Title = "Name" }
Add-PnPField -List $responseUserDataList -DisplayName "Email" -InternalName "email" -Type Text -AddToDefaultView
Add-PnPField -List $responseUserDataList -DisplayName "Country" -InternalName "country" -Type Text -AddToDefaultView

##**User Answer**
$AnswerListTitle = "Cyber Security Answer"
New-PnPList -Title $AnswerListTitle -Url "lists/CyberSecurityAnswers" -Template GenericList 

$AnswerList = Get-PnPList -Identity $AnswerListTitle
Set-PnPField -List $AnswerList -Identity "Title" -Values @{ Title = "Name" }
Add-PnPField -List $AnswerList -DisplayName "Answer" -InternalName "answer" -Type Note

#Add Lookup Field to the List   
Add-PnPField -List $AnswerList -Type Lookup -DisplayName "Question" -InternalName "question" -AddToDefaultView
Set-PnPField -List $AnswerList -Identity "question" -Values @{LookupList= $questionList.Id.ToString(); LookupField="Title"}

Add-PnPField -List $AnswerList -Type Lookup -DisplayName "User response" -InternalName "userResponse" -AddToDefaultView
Set-PnPField -List $AnswerList -Identity "userResponse" -Values @{LookupList= $responseUserDataList.Id.ToString(); LookupField="Title"}


