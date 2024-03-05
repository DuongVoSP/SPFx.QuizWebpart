###Setup site
$siteUrl = "https://upheadsdeveloper.sharepoint.com/sites/StaffManagement"
Connect-PnPOnline -url $siteUrl -UseWebLogin
Enable-PnPFeature -Identity "3bae86a2-776d-499d-9db8-fa4cdc7884f8" -Scope Site -ErrorAction Stop

###Other dev
$siteUrl = "https://upheads.sharepoint.com/HR"
Connect-PnPOnline -url $siteUrl -ClientId "120913e9-a4c2-4826-a263-09ef2daf347d" -ClientSecret "FcT5A5bl/5odT+zH4J9RBUBGTXCvi3yGyiQ8G40qhpc=" 
Enable-PnPFeature -Identity "3bae86a2-776d-499d-9db8-fa4cdc7884f8" -Scope Site -ErrorAction Stop

$web = Get-PnPWeb
Get-PnPProperty -ClientObject $web -Property IsMultilingual, UICulture
$web.IsMultilingual
$web.AddSupportedUILanguage(1044)
$web.Update()
$web.UICulture 

#####Setup Lists#######
##**Skills**
$skillTitle = "Skills"
New-PnPList -Title $skillTitle -Url "lists/Skills" -Template GenericList 

$skillList = Get-PnPList -Identity $skillTitle
Set-PnPField -List $skillList -Identity "Title" -Values @{ Title = "Name" }
Add-PnPField -List $skillList -DisplayName "Type" -InternalName "skillType" -Type Choice -Choices "SkillGroup", "Skill" -AddToDefaultView
Add-PnPField -List $skillList -DisplayName "Description" -InternalName "description" -Type Note -AddToDefaultView
Add-PnPField -List $skillList -DisplayName "Evaluation Type" -InternalName "evaluationType" -Type Choice -AddToDefaultView -Choices "ScoreAndComment", "Score", "Comment"
Add-PnPField -List $skillList -DisplayName "Group" -InternalName "group" -Type Text
Add-PnPField -List $skillList -DisplayName "Group Id" -InternalName "groupId" -Type Number


##**Departments**: define **Location**, **Office Manager**, **Introduce the office**
$departmentTitle = "Departments"
New-PnPList -Title $departmentTitle -Url "lists/Departments" -Template GenericList 

$departmentList = Get-PnPList -Identity $departmentTitle
Set-PnPField -List $departmentList -Identity "Title" -Values @{ Title = "Name" }
Add-PnPField -List $departmentList -DisplayName "Location" -InternalName "location" -Type Text -AddToDefaultView
Add-PnPField -List $departmentList -DisplayName "Office Manager" -InternalName "manager" -Type User -AddToDefaultView
Add-PnPField -List $departmentList -DisplayName "Introduction" -InternalName "introduction" -Type Note -AddToDefaultView
Add-PnPField -List $departmentList -DisplayName "Bravo Department Id" -InternalName "bravoDepartmentId" -Type Text
Add-PnPField -List $departmentList -DisplayName "Bravo Resource Type Id" -InternalName "bravoResourceTypeId" -Type Text

##**Recruitments**
$recruitmentTitle = "Recruitment"
New-PnPList -Title $recruitmentTitle -Url "lists/Recruitment" -Template GenericList 

$recruitmentList = Get-PnPList -Identity $recruitmentTitle
Add-PnPField -List $recruitmentList -DisplayName "Require Skills" -InternalName "requireSkills" -Type Text -AddToDefaultView
Add-PnPField -List $recruitmentList -DisplayName "Optional Skills" -InternalName "optionalSkills" -Type Text -AddToDefaultView
Add-PnPField -List $recruitmentList -DisplayName "Department" -InternalName "departmentId" -Type Integer -AddToDefaultView
Add-PnPField -List $recruitmentList -DisplayName "Description" -InternalName "description" -Type Note -AddToDefaultView
Add-PnPField -List $recruitmentList -DisplayName "Open Date" -InternalName "fromDate" -Type DateTime -AddToDefaultView
Add-PnPField -List $recruitmentList -DisplayName "Close Date" -InternalName "endDate" -Type DateTime -AddToDefaultView

##**Recruitments**
$recruitmentPostTitle = "RecruitmentPosts"
New-PnPList -Title $recruitmentPostTitle -Url "lists/RecruitmentPosts" -Template GenericList 

$recruitmentPostList = Get-PnPList -Identity $recruitmentPostTitle
Add-PnPField -List $recruitmentPostList -DisplayName "Content" -InternalName "content" -Type Note -AddToDefaultView


##**Recruitments**
$interviewTitle = "Interview Session"
New-PnPList -Title $interviewTitle -Url "lists/InterviewSession" -Template GenericList 

$interviewList = Get-PnPList -Identity $interviewTitle
Add-PnPField -List $interviewList -DisplayName "Interview Start Date" -InternalName "interviewStartDate" -Type DateTime 
Add-PnPField -List $interviewList -DisplayName "Interview End Date" -InternalName "interviewEndDate" -Type DateTime 
Add-PnPField -List $interviewList -DisplayName "Location" -InternalName "location" -Type Text
Add-PnPFieldFromXml -List $interviewList -FieldXml '<Field ClientSideComponentId="00000000-0000-0000-0000-000000000000" DisplayName="Interviewer" Format="Dropdown" List="UserInfo" Mult="TRUE" Name="interviewer" Title="Interviewers" Type="UserMulti" UserSelectionMode="PeopleOnly" UserSelectionScope="0" ID="{a8af53a5-137b-40c2-ab72-ad1db8b84689}" StaticName="interviewer" SourceID="{00000000-0000-0000-0000-000000000000}" ColName="int1" RowOrdinal="0" />'
Add-PnPField -List $interviewList -DisplayName "Order" -InternalName "interviewOrder" -Type Integer  
Add-PnPField -List $interviewList -DisplayName "Status" -InternalName "interviewStatus" -Type Choice -Choices "NotStart", "Interviewing", "WaitingFeedback", "Canceled", "Done"
Add-PnPField -List $interviewList -DisplayName "Applicant Id" -InternalName "applicantId" -Type Integer
Add-PnPField -List $interviewList -DisplayName "Recruitment Id" -InternalName "recruitmentId" -Type Integer
Add-PnPField -List $interviewList -DisplayName "Candidate" -InternalName "candidateName" -Type Text
Add-PnPField -List $interviewList -DisplayName "Assessments" -InternalName "assessments" -Type Text

#Create Document Set
$ContentTypeName = "Job Application"
Add-PnPContentType -Name $ContentTypeName -Group "Document Set Content Types" -ContentTypeId "0x0120D520001CFD84D0C64B7940B37C4FB8FE2CD48D"                                                                                             

$jobCT = Get-PnPContentType -Identity $ContentTypeName

Add-PnPField -DisplayName "Apply to" -InternalName "recruitmentId" -Type Text 
Add-PnPFieldToContentType -ContentType $jobCT -Field "recruitmentId"

Add-PnPField -DisplayName "Candidate Id" -InternalName "candidateId" -Type Text 
Add-PnPFieldToContentType -ContentType $jobCT -Field "candidateId"

Add-PnPField -DisplayName "Status" -InternalName "candidateStatus" -Type Choice -Choices "New", "InProgress", "Interviewing", "OfferSent", "Passed", "NotMatch", "Rejected", "Archived", "Signed", "SignedOff" 
Add-PnPFieldToContentType -ContentType $jobCT -Field "candidateStatus"

Add-PnPField -DisplayName "Candidate tags" -InternalName "candidateTags" -Type Text  
Add-PnPFieldToContentType -ContentType $jobCT -Field "candidateTags"

Add-PnPField -DisplayName "Card index" -InternalName "cardIndex" -Type Text  
Add-PnPFieldToContentType -ContentType $jobCT -Field "cardIndex"

Set-PnPDocumentSetField -Field "recruitmentId" -DocumentSet $jobCT -SetSharedField -SetWelcomePageField
Set-PnPDocumentSetField -Field "Title" -DocumentSet $jobCT -SetSharedField -SetWelcomePageField

##**Candidate Folder**
$candidateFolderTitle = "Candidate Folder"
New-PnPList -Title $candidateFolderTitle -Url "CandidateFolder" -Template DocumentLibrary 

$candidateFolderList = Get-PnPList -Identity $candidateFolderTitle
Add-PnPContentTypeToList -List $candidateFolderList -ContentType $jobCT

Set-PnPField -List $candidateFolderList -Identity "Title" -Values @{ Title = "Application Name"; Hidden = $false }
Set-PnPField -List $candidateFolderList -Identity "DocumentSetDescription" -Values @{ Title = "Summary" }
Add-PnPField -List $candidateFolderList -DisplayName "Type" -InternalName "docType" -Type Choice -Choices "Avatar", "Curriculum Vitae", "Cover Letter", "Certificate", "Email", "Interview Feedback", "Other" -AddToDefaultView


##**Candidate info list**
$candidateTitle = "Candidates"
New-PnPList -Title $candidateTitle -Url "lists/Candidates" -Template GenericList 

$candidateList = Get-PnPList -Identity $candidateTitle
Set-PnPField -List $candidateList -Identity "Title" -Values @{ Title = "Candidate Name" }
Add-PnPField -List $candidateList -DisplayName "First Name" -InternalName "firstName" -Type Text 
Add-PnPField -List $candidateList -DisplayName "Last Name" -InternalName "lastName" -Type Text 
Add-PnPField -List $candidateList -DisplayName "Phone" -InternalName "candidatePhone" -Type Text 
Add-PnPField -List $candidateList -DisplayName "Email" -InternalName "candidateEmail" -Type Text 
Add-PnPField -List $candidateList -DisplayName "Personal link" -InternalName "personalLink" -Type Text 
Add-PnPFieldFromXml -List $candidateList '<Field Type="Note" DisplayName="Logs" Required="FALSE" EnforceUniqueValues="FALSE" Indexed="FALSE" UnlimitedLengthInDocumentLibrary="TRUE" NumLines="6" RichText="True" AppendOnly="TRUE" Sortable="FALSE" ID="{31ee84f6-2bbf-4d28-912b-8b5881a39e45}" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="candidateLogs" Name="candidateLogs" ></Field>'
Add-PnPFieldFromXml -List $candidateList '<Field Type="Text" Name="employeeId" DisplayName="employeeId" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="employeeId" ColName="nvarchar6" RowOrdinal="0" />'


##**Candidate tags list**
$candidateTagsTitle = "Candidate Tags"
New-PnPList -Title $candidateTagsTitle -Url "lists/CandidateTags" -Template GenericList 

$candidateTagsList = Get-PnPList -Identity $candidateTagsTitle
Set-PnPField -List $candidateTagsList -Identity "Title" -Values @{ Title = "Tag name" }
Add-PnPField -List $candidateTagsList -DisplayName "Index" -InternalName "index" -Type Number 
Add-PnPField -List $candidateTagsList -DisplayName "Color" -InternalName "color" -Type Text 
Add-PnPField -List $candidateTagsList -DisplayName "Deactive" -InternalName "deactive" -Type Boolean 

##**Email template** *
$emailTemplateTitle = "Email Templates"
New-PnPList -Title $emailTemplateTitle -Url "lists/EmailTemplates" -Template GenericList

$emailTemplateList = Get-PnPList -Identity $emailTemplateTitle
Add-PnPField -List $emailTemplateList -DisplayName "Subject" -InternalName "emailSubject" -Type Text 
Add-PnPFieldFromXml -List $emailTemplateList '<Field Type="Note" DisplayName="Body" Required="FALSE" EnforceUniqueValues="FALSE" Indexed="FALSE" UnlimitedLengthInDocumentLibrary="TRUE" NumLines="6" RichText="TRUE" AppendOnly="FALSE" Sortable="FALSE" ID="{31ee84f6-2bbf-4d28-9999-8b5881a39e01}" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="emailBody" Name="emailBody" ColName="ntext2" RowOrdinal="0" CustomFormatter="" RestrictedMode="TRUE" RichTextMode="FullHtml" IsolateStyles="TRUE" />'
Add-PnPFieldFromXml -List $emailTemplateList '<Field Type="Note" DisplayName="Last Used" Required="FALSE" EnforceUniqueValues="FALSE" Indexed="FALSE" UnlimitedLengthInDocumentLibrary="TRUE" NumLines="6" RichText="True" AppendOnly="TRUE" Sortable="FALSE" ID="{31ee84f6-2bbf-4d28-9999-8b5881a39e02}" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="lastUse" Name="lastUse" ></Field>'
Add-PnPField -List $emailTemplateList -DisplayName "System Id" -InternalName "systemId" -Type Integer 

# ##**Scorecards** *
# $scorecardTitle = "Scorecards"
# New-PnPList -Title $scorecardTitle -Url "lists/Scorecards" -Template GenericList

##**Ansatte**
$employeeTitle = "Employees"
New-PnPList -Title $employeeTitle -Url "lists/employees" -Template GenericList 

$employeeList = Get-PnPList -Identity $employeeTitle

Add-PnPFieldFromXml -List $employeeList '<Field Type="Text" Name="email" DisplayName="Epost" ID="{a422292f-2e72-4039-93a6-02dcb3e1b7f0}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="email" ColName="nvarchar4" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Description="Map to AD User" DisplayName="User" Format="Dropdown" IsModern="TRUE" List="UserInfo" Name="User" Title="User" Type="User" UserDisplayOptions="NamePhoto" UserSelectionMode="0" UserSelectionScope="0" ID="{c4534ba4-e299-45c0-b4d0-835af0de0d70}" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="User" ColName="int1" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Text" Name="personGUID" DisplayName="personGUID" ID="{a2410083-1524-4f3e-9073-2d346f2f8ae0}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="personGUID" ColName="nvarchar6" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Text" Name="department" DisplayName="Avdeling" ID="{31b17a19-5d2d-471b-bcd8-aea44e7e1b40}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="department" ColName="nvarchar7" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Text" Name="nameFirst" DisplayName="Fornavn" ID="{c5ea3e6f-35c5-474d-be74-b19471a4f7f0}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="nameFirst" ColName="nvarchar8" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Text" Name="nameMiddle" DisplayName="Mellomnavn" ID="{f4a29f82-352d-4644-8c68-dba9babab0c0}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="nameMiddle" ColName="nvarchar9" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Text" Name="nameLast" DisplayName="Etternavn" ID="{a372efe1-00b8-4600-8878-609b220c7490}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="nameLast" ColName="nvarchar10" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Integer" Name="employeeNo" DisplayName="Ansattnummer" ID="{2a1861aa-8c64-4192-b2d6-9f1e1dd90830}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="employeeNo" ColName="int2" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="DateTime" Name="dateOfBirth" DisplayName="Fødselsdag" ID="{d43da4d4-78cf-4b20-b0ab-dbb3dea17af0}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="dateOfBirth" ColName="datetime1" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Text" Name="address" DisplayName="Adresse" ID="{bad5d79a-a25a-43e9-bba8-ba880350cd40}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="address" ColName="nvarchar11" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Text" Name="phoneWork" DisplayName="Tlf. Jobb" ID="{c245d587-f09a-4071-a5b8-6f119f28ae30}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="phoneWork" ColName="nvarchar12" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Text" Name="phoneHome" DisplayName="Tlf. Hjem" ID="{d38a7060-e424-4621-91b9-4b209a4bc550}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="phoneHome" ColName="nvarchar13" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Text" Name="phoneMobile" DisplayName="Tlf. Mobil" ID="{00e845e7-f50c-49d6-beb0-1f6a83ceda90}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="phoneMobile" ColName="nvarchar14" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Text" Name="jobTitle" DisplayName="Jobbtittel" ID="{9ae6f604-ed67-4bee-b8d0-94ae57248da0}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="jobTitle" ColName="nvarchar15" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Text" Name="poBox" DisplayName="Postboks" ID="{809473d1-35b8-4be0-8bff-2aa07dbc9930}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="poBox" ColName="nvarchar16" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Text" Name="zipCode" DisplayName="Postnummer" ID="{f1a5077a-b228-4720-bf4e-7d4d199320c0}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="zipCode" ColName="int4" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Text" Name="city" DisplayName="By" ID="{dee85886-6668-4999-94df-7f6e01077ed0}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="city" ColName="nvarchar17" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Text" Name="country" DisplayName="Land" ID="{5a00e704-5d52-4968-9dcb-826b44b91b50}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="country" ColName="nvarchar18" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Text" Name="Gender" DisplayName="Kjønn" ID="{7bf4dfa2-7093-43f0-81e9-28e3905774d0}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="Gender" ColName="nvarchar19" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Note" Name="comment" DisplayName="Kommentar" ID="{f91a9e99-2bae-471d-af62-86a3a5bea760}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="comment" ColName="ntext2" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Text" Name="status" DisplayName="Status" ID="{3b38fb53-5fcc-4658-888e-c17aa7088c00}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="status" ColName="nvarchar20" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="Note" Name="aboutMe" DisplayName="Om meg" ID="{484837f4-891c-4aaa-8a23-4e6342ca7000}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="aboutMe" ColName="ntext3" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="DateTime" Name="startDate" DisplayName="Start date" ID="{cfb10b92-a23c-4b3c-97df-dfce6ced7e50}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="startDate" ColName="datetime2" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field Type="DateTime" Name="terminationDate" DisplayName="Termination date" ID="{b92802d2-7b2c-4ea5-9af6-cc45fd0d6d90}" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="terminationDate" ColName="datetime3" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $employeeList '<Field DisplayName="modifiedDate" FriendlyDisplayFormat="Disabled" Format="DateTime" IsModern="TRUE" Name="modifiedDate" Title="modifiedDate" Type="DateTime" ID="{6452bc86-b0ab-4d1f-90dd-d08156dd8820}" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="modifiedDate" ColName="datetime4" RowOrdinal="0" />'


##**Oppgaver Template**: define tasks should be generated for On/Off boarding process for Generic and specific department.
$oppgaverTemplateTitle = "Oppgaver Template"
New-PnPList -Title $oppgaverTemplateTitle -Url "lists/OppgaverTemplate" -Template GenericList 

$oppgaverTemplateList = Get-PnPList -Identity $oppgaverTemplateTitle
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Integer" Name="respID" DisplayName="respID"  Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="respID" ColName="int1" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Note" Name="descr" DisplayName="Beskrivelse"  Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="descr" ColName="ntext2" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Text" Name="taskType" DisplayName="Oppgavetype"  Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="taskType" ColName="nvarchar5" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Text" Name="category" DisplayName="Kategori"  Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="category" ColName="nvarchar6" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="DateTime" Name="dueDate" DisplayName="Frist"  Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="dueDate" ColName="datetime1" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Text" Name="status" DisplayName="Status"  Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="status" ColName="nvarchar7" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Text" Name="priority" DisplayName="Prioritet" Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="priority" ColName="nvarchar8" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Text" Name="completed" DisplayName="Fullført"  Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="completed" ColName="nvarchar9" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Text" Name="ref" DisplayName="Tilhører"  Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="ref" ColName="nvarchar10" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Integer" Name="refID" DisplayName="refID"  Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="refID" ColName="int2" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Text" Name="company" DisplayName="Firma"  Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="company" ColName="nvarchar11" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Integer" Name="companyID" DisplayName="firmaID"  Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="companyID" ColName="int3" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Text" Name="contact" DisplayName="Kontakt"  Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="contact" ColName="nvarchar12" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Text" Name="contactEmail" DisplayName="kontaktEpost"  Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="contactEmail" ColName="nvarchar13" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Text" Name="mandatory" DisplayName="Obligatorisk"  Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="mandatory" ColName="nvarchar14" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Note" Name="followUpComment" DisplayName="Oppfølging"  Group="" Required="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="followUpComment" ColName="ntext3" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="DateTime" Name="followUpDate" DisplayName="Oppfølgingsdato" Format="DateOnly" Required="False" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="followUpDate" ColName="datetime2" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field DisplayName="refListe" Format="Dropdown" IsModern="TRUE" MaxLength="255" Name="refListe" Title="refListe" Type="Text"  SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="refListe" ColName="nvarchar15" RowOrdinal="0" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Text" DisplayName="Oppfølgingstatus" Required="FALSE" EnforceUniqueValues="FALSE" Indexed="FALSE" MaxLength="255"  SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="followUpStatus" Name="followUpStatus" ColName="nvarchar16" RowOrdinal="0" CustomFormatter=""  />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Text" DisplayName="Verifisert av" Required="FALSE" EnforceUniqueValues="FALSE" Indexed="FALSE" MaxLength="255"  SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="verifiedBy" Name="verifiedBy" ColName="nvarchar17" RowOrdinal="0" CustomFormatter="" />'
Add-PnPFieldFromXml -List $oppgaverTemplateList '<Field Type="Number" DisplayName="verifiedByID" Required="FALSE" EnforceUniqueValues="FALSE" Indexed="FALSE" SourceID="{00000000-0000-0000-0000-000000000000}" StaticName="verifiedByID" Name="verifiedByID" ColName="float1" RowOrdinal="0" CustomFormatter="" Percentage="FALSE" />'



#-----Task list-----#
$oppgaverTitle = "Oppgaver"
New-PnPList -Title $oppgaverTitle -Url "Lists/Oppgaver" -Template GenericList -EnableVersioning -OnQuickLaunch

$oppgaverList = Get-PnPList -Identity $oppgaverTitle
Set-PnPField -List $oppgaverList -Identity "Title" -Values @{Title = "Tittel" } 
Add-PnPField -List $oppgaverList -InternalName "resp" -DisplayName "Ansvarlig" -Type Text
Add-PnPField -List $oppgaverList -InternalName "respID" -DisplayName "respID" -Type Integer
Add-PnPField -List $oppgaverList -InternalName "respEmail" -DisplayName "Ansvarlig e-post" -Type Text
Add-PnPField -List $oppgaverList -InternalName "descr" -DisplayName "Beskrivelse" -Type Note
Add-PnPField -List $oppgaverList -InternalName "taskType" -DisplayName "Oppgavetype" -Type Text -AddToDefaultView
Add-PnPField -List $oppgaverList -InternalName "category" -DisplayName "Kategori" -Type Text -AddToDefaultView
Add-PnPField -List $oppgaverList -InternalName "dueDate" -DisplayName "Frist" -Type DateTime -AddToDefaultView
Add-PnPField -List $oppgaverList -InternalName "status" -DisplayName "Status" -Type Text -AddToDefaultView
Add-PnPField -List $oppgaverList -InternalName "priority" -DisplayName "Prioritet" -Type Text -AddToDefaultView
Add-PnPField -List $oppgaverList -InternalName "completed" -DisplayName "Fullført" -Type Text -AddToDefaultView
Add-PnPField -List $oppgaverList -InternalName "ref" -DisplayName "Tilhører" -Type Text
Add-PnPField -List $oppgaverList -InternalName "refID" -DisplayName "refID" -Type Integer
Add-PnPField -List $oppgaverList -InternalName "refListe" -DisplayName "refListe" -Type Text
Add-PnPField -List $oppgaverList -InternalName "company" -DisplayName "Firma" -Type Text -AddToDefaultView
Add-PnPField -List $oppgaverList -InternalName "companyID" -DisplayName "companyID" -Type Integer
Add-PnPField -List $oppgaverList -InternalName "firmaID" -DisplayName "firmaID" -Type Integer
Add-PnPField -List $oppgaverList -InternalName "contact" -DisplayName "Kontakt" -Type Text
Add-PnPField -List $oppgaverList -InternalName "contactEmail" -DisplayName "kontaktEpost" -Type Text
Add-PnPField -List $oppgaverList -InternalName "mandatory" -DisplayName "Obligatorisk" -Type Text
Add-PnPField -List $oppgaverList -InternalName "followUpComment" -DisplayName "Oppfølging" -Type Note
Add-PnPField -List $oppgaverList -InternalName "followUpStatus" -DisplayName "Oppfølgingstatus" -Type Text
$Guid = [GUID]::NewGuid()
$xml = '<Field ID= "{' + $Guid + '}" Type="DateTime" Name="followUpDate" DisplayName="Oppfølgingsdato" Format="DateOnly" Required="False" />'
Add-PnPFieldFromXml -List $oppgaverList -FieldXml $xml

#-----Task notify list-----#
$oppgVarslingTitle = "OppgVarsling"
New-PnPList -Title $oppgVarslingTitle -Url "Lists/OppgVarsling" -Template GenericList -EnableVersioning 

$oppgVarslingList = Get-PnPList -Identity $oppgVarslingTitle
Set-PnPField -List $oppgVarslingList -Identity "Title" -Values @{Title = "Oppgave" }
Add-PnPField -List $oppgVarslingList -InternalName "taskID" -DisplayName "oppgID" -Type Integer
Add-PnPField -List $oppgVarslingList -InternalName "contact" -DisplayName "Kontakt" -Type Text -AddToDefaultView
Add-PnPField -List $oppgVarslingList -InternalName "contactID" -DisplayName "contactID" -Type Text

#-----Task comments list-----#
$oppgKommentarTitle = "OppgKommentar"
New-PnPList -Title $oppgKommentarTitle -Url "Lists/Oppgkommentar" -Template GenericList -EnableVersioning 

$oppgKommentarList = Get-PnPList -Identity $oppgKommentarTitle
New-PnPList -Title $oppgKommentarList -Url oppgkommentar -Template GenericList -EnableVersioning
Set-PnPField -List $oppgKommentarList -Identity "Title" -Values @{Title = "Oppgave" } 
Add-PnPField -List $oppgKommentarList -InternalName "comment" -DisplayName "Kommentar" -Type Note
Add-PnPField -List $oppgKommentarList -InternalName "taskID" -DisplayName "oppgID" -Type Integer

#-----Task categories list-----#
$oppgKategorierTitle = "OppgKategorier"
New-PnPList -Title $oppgKategorierTitle -Url "Lists/Oppgkategorier" -Template GenericList -EnableVersioning 

$oppgKategorierList = Get-PnPList -Identity $oppgKategorierTitle
Set-PnPField -List $oppgKategorierList -Identity "Title" -Values @{Title = "Kategori" } 
Add-PnPField -List $oppgKategorierList -InternalName "taskType" -DisplayName "Oppgavetype" -Type Text

#-----Add default categories to list-----#
Add-PnPListItem -List $oppgKategorierList -Values @{
    "Title"    = "Onboarding";
    "taskType" = "Oppgave";
}
Add-PnPListItem -List $oppgKategorierList -Values @{
    "Title"    = "Offboarding";
    "taskType" = "Oppgave";
}

##**Task Checklist**          
$taskChecklistTitle = "Task Checklist"
New-PnPList -Title $taskChecklistTitle -Url "lists/TaskChecklist" -Template GenericList 

$taskChecklistList = Get-PnPList -Identity $taskChecklistTitle
Add-PnPField -List $taskChecklistList -DisplayName "Description" -InternalName "description" -Type Note 
Add-PnPField -List $taskChecklistList -DisplayName "Department" -InternalName "departmentId" -Type Integer -AddToDefaultView # use 0 for General department
Add-PnPField -List $taskChecklistList -DisplayName "Use for" -InternalName "useFor" -Type Choice -Choices "All", "On Boarding", "Off Boarding"
Add-PnPField -List $taskChecklistList -DisplayName "Order" -InternalName "order" -Type Integer
Add-PnPField -List $taskChecklistList -DisplayName "Default responsible" -InternalName "defaultResponsible" -Type User -AddToDefaultView

##**Task Checklist**          
$employeeTransitionTitle = "Employee Transition"
New-PnPList -Title $employeeTransitionTitle -Url "lists/EmployeeTransition" -Template GenericList 

$employeeTransitionList = Get-PnPList -Identity $employeeTransitionTitle
Add-PnPField -List $employeeTransitionList -DisplayName "Description" -InternalName "description" -Type Note 
Add-PnPField -List $employeeTransitionList -DisplayName "Employee Name" -InternalName "employeeName" -Type Text
Add-PnPField -List $employeeTransitionList -DisplayName "Employee Id" -InternalName "employeeId" -Type Integer
Add-PnPField -List $employeeTransitionList -DisplayName "Employee Title" -InternalName "employeeTitle" -Type Text
Add-PnPField -List $employeeTransitionList -DisplayName "Type" -InternalName "type" -Type Choice -Choices "On Boarding", "Off Boarding"
Add-PnPField -List $employeeTransitionList -DisplayName "Status" -InternalName "status" -Type Choice -Choices "OnGoing", "Done"
Add-PnPField -List $employeeTransitionList -DisplayName "Due date" -InternalName "dueDate" -Type DateTime
Add-PnPField -List $employeeTransitionList -DisplayName "Date" -InternalName "date" -Type DateTime
Add-PnPField -List $employeeTransitionList -DisplayName "Ansvarlig" -InternalName "resp" -Type Text
Add-PnPField -List $employeeTransitionList -DisplayName "respID" -InternalName "respID" -Type Integer
Add-PnPField -List $employeeTransitionList -DisplayName "respEmail" -InternalName "respEmail" -Type Text
Add-PnPField -List $employeeTransitionList -DisplayName "Department" -InternalName "departmentId" -Type Integer


#####Setup References#######
##**References**
$referencesTitle = "References"
New-PnPList -Title $referencesTitle -Url "lists/References" -Template GenericList 

$skillList = Get-PnPList -Identity $referencesTitle
Set-PnPField -List $skillList -Identity "Title" -Values @{ Title = "Full name" }
Add-PnPField -List $skillList -DisplayName "Job title" -InternalName "jobTitle" -Type Text -AddToDefaultView
Add-PnPField -List $skillList -DisplayName "Email" -InternalName "email" -Type Text -AddToDefaultView
Add-PnPField -List $skillList -DisplayName "Phone" -InternalName "phone" -Type Text -AddToDefaultView
Add-PnPField -List $skillList -DisplayName "Comment" -InternalName "comment" -Type Note -AddToDefaultView
Add-PnPField -List $skillList -DisplayName "Candidate Id" -InternalName "candidateId" -Type Integer 
