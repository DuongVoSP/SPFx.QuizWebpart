###Setup site
$siteUrl = "https://upheadsdeveloper.sharepoint.com/sites/StaffManagement"
Connect-PnPOnline -url $siteUrl -UseWebLogin
##**Departments**: define **Location**, **Office Manager**, **Introduce the office**
$departmentList = Get-PnPList -Identity $departmentTitle
Add-PnPListItem -List $departmentList -Values @{"Title" = "Avdelingsledere"; "location" = "Bergen"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Edvard Griegsvei 3b - City Bergen - ZipCode 5068"; "bravoDepartmentId" = "5260DD6D-FBE9-4947-A03B-38BAF7F19C91"; "bravoResourceTypeId" = "20" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "IT Konsulenter"; "location" = "Bergen"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Edvard Griegsvei 3b - City Bergen - ZipCode 5068"; "bravoDepartmentId" = "5260DD6D-FBE9-4947-A03B-38BAF7F19C91"; "bravoResourceTypeId" = "10" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Salg"; "location" = "Bergen"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = "NULL Address: Edvard Griegsvei 3b - City Bergen - ZipCode 5068"; "bravoDepartmentId" = "5260DD6D-FBE9-4947-A03B-38BAF7F19C91"; "bravoResourceTypeId" = "5" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "IT Konsulenter"; "location" = "Drammen"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Nedre Storgate 29 - City Drammen - ZipCode 3015"; "bravoDepartmentId" = "1ADF218A-6778-4CC7-83F0-38DC997AF7DA"; "bravoResourceTypeId" = "10" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Avdelingsledere"; "location" = "Haugesund"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Kvalamarka 31 - City Haugesund - ZipCode 5514"; "bravoDepartmentId" = "6A187F68-A6A5-47F8-A8E0-DBBF11DCD658"; "bravoResourceTypeId" = "20" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "IT Konsulenter"; "location" = "Haugesund"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Kvalamarka 31 - City Haugesund - ZipCode 5514"; "bravoDepartmentId" = "6A187F68-A6A5-47F8-A8E0-DBBF11DCD658"; "bravoResourceTypeId" = "10" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Salg"; "location" = "Haugesund"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = "NULL Address: Kvalamarka 31 - City Haugesund - ZipCode 5514"; "bravoDepartmentId" = "6A187F68-A6A5-47F8-A8E0-DBBF11DCD658"; "bravoResourceTypeId" = "5" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Software"; "location" = "Haugesund"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Kvalamarka 31 - City Haugesund - ZipCode 5514"; "bravoDepartmentId" = "6A187F68-A6A5-47F8-A8E0-DBBF11DCD658"; "bravoResourceTypeId" = "14" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Software - Haugesund"; "location" = "Haugesund"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Kvalamarka 31 - City Haugesund - ZipCode 5514"; "bravoDepartmentId" = "6A187F68-A6A5-47F8-A8E0-DBBF11DCD658"; "bravoResourceTypeId" = "18" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Avdelingsledere"; "location" = "Oslo"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Olaf Helsets vei 5 - City Oslo - ZipCode 694"; "bravoDepartmentId" = "B131C06F-77A0-4A88-8E14-36CD9AF0E3D7"; "bravoResourceTypeId" = "20" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Cloud & Mgd Services"; "location" = "Oslo"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Olaf Helsets vei 5 - City Oslo - ZipCode 694"; "bravoDepartmentId" = "B131C06F-77A0-4A88-8E14-36CD9AF0E3D7"; "bravoResourceTypeId" = "8" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "IT Konsulenter"; "location" = "Oslo"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Olaf Helsets vei 5 - City Oslo - ZipCode 694"; "bravoDepartmentId" = "B131C06F-77A0-4A88-8E14-36CD9AF0E3D7"; "bravoResourceTypeId" = "10" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "IT Konsulenter nyansatte"; "location" = "Oslo"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = "0% fakturagrad første 3 mndene Address: Olaf Helsets vei 5 - City Oslo - ZipCode 694"; "bravoDepartmentId" = "B131C06F-77A0-4A88-8E14-36CD9AF0E3D7"; "bravoResourceTypeId" = "21" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Kundeutvikling"; "location" = "Oslo"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Olaf Helsets vei 5 - City Oslo - ZipCode 694"; "bravoDepartmentId" = "B131C06F-77A0-4A88-8E14-36CD9AF0E3D7"; "bravoResourceTypeId" = "19" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Økonomi"; "location" = "Oslo"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Olaf Helsets vei 5 - City Oslo - ZipCode 694"; "bravoDepartmentId" = "B131C06F-77A0-4A88-8E14-36CD9AF0E3D7"; "bravoResourceTypeId" = "15" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Avdelingsledere"; "location" = "Sandefjord"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Borgeskogen 47 - City Stokke - ZipCode 3160"; "bravoDepartmentId" = "B5A6D5B2-CF3D-422F-B643-FECE1706C0F1"; "bravoResourceTypeId" = "20" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "IT Konsulenter"; "location" = "Sandefjord"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Borgeskogen 47 - City Stokke - ZipCode 3160"; "bravoDepartmentId" = "B5A6D5B2-CF3D-422F-B643-FECE1706C0F1"; "bravoResourceTypeId" = "10" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Salg"; "location" = "Sandefjord"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = "NULL Address: Borgeskogen 47 - City Stokke - ZipCode 3160"; "bravoDepartmentId" = "B5A6D5B2-CF3D-422F-B643-FECE1706C0F1"; "bravoResourceTypeId" = "5" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Avdelingsledere"; "location" = "Stavanger"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Vestre Svanholmen 4 - City Sandnes - ZipCode 4313"; "bravoDepartmentId" = "6229FFF3-2B75-4518-8E3D-F800242BE67A"; "bravoResourceTypeId" = "20" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Cloud & Mgd Services"; "location" = "Stavanger"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Vestre Svanholmen 4 - City Sandnes - ZipCode 4313"; "bravoDepartmentId" = "6229FFF3-2B75-4518-8E3D-F800242BE67A"; "bravoResourceTypeId" = "8" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Faktura og admin"; "location" = "Stavanger"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Vestre Svanholmen 4 - City Sandnes - ZipCode 4313"; "bravoDepartmentId" = "6229FFF3-2B75-4518-8E3D-F800242BE67A"; "bravoResourceTypeId" = "16" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "IT Konsulenter"; "location" = "Stavanger"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Vestre Svanholmen 4 - City Sandnes - ZipCode 4313"; "bravoDepartmentId" = "6229FFF3-2B75-4518-8E3D-F800242BE67A"; "bravoResourceTypeId" = "10" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "IT Konsulenter nyansatte"; "location" = "Stavanger"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = "0% fakturagrad første 3 mndene Address: Vestre Svanholmen 4 - City Sandnes - ZipCode 4313"; "bravoDepartmentId" = "6229FFF3-2B75-4518-8E3D-F800242BE67A"; "bravoResourceTypeId" = "21" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Kundeutvikling"; "location" = "Stavanger"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Vestre Svanholmen 4 - City Sandnes - ZipCode 4313"; "bravoDepartmentId" = "6229FFF3-2B75-4518-8E3D-F800242BE67A"; "bravoResourceTypeId" = "19" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Løsninger og prosjekt"; "location" = "Stavanger"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Vestre Svanholmen 4 - City Sandnes - ZipCode 4313"; "bravoDepartmentId" = "6229FFF3-2B75-4518-8E3D-F800242BE67A"; "bravoResourceTypeId" = "17" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Salg"; "location" = "Stavanger"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = "NULL Address: Vestre Svanholmen 4 - City Sandnes - ZipCode 4313"; "bravoDepartmentId" = "6229FFF3-2B75-4518-8E3D-F800242BE67A"; "bravoResourceTypeId" = "5" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Service Desk"; "location" = "Stavanger"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = "NULL Address: Vestre Svanholmen 4 - City Sandnes - ZipCode 4313"; "bravoDepartmentId" = "6229FFF3-2B75-4518-8E3D-F800242BE67A"; "bravoResourceTypeId" = "11" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Software"; "location" = "Stavanger"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Vestre Svanholmen 4 - City Sandnes - ZipCode 4313"; "bravoDepartmentId" = "6229FFF3-2B75-4518-8E3D-F800242BE67A"; "bravoResourceTypeId" = "14" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Økonomi"; "location" = "Stavanger"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Vestre Svanholmen 4 - City Sandnes - ZipCode 4313"; "bravoDepartmentId" = "6229FFF3-2B75-4518-8E3D-F800242BE67A"; "bravoResourceTypeId" = "15" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Løsninger og prosjekt"; "location" = "Teknograd"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Schweigaards gate 10 - City Oslo - ZipCode 185"; "bravoDepartmentId" = "5707ECD2-AF90-46B8-9D29-0B7D59E77F66"; "bravoResourceTypeId" = "17" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Avdelingsledere"; "location" = "Trondheim"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Vestre Rosten 69 - City Heimdal - ZipCode 7072"; "bravoDepartmentId" = "DC18771B-BADF-4305-B640-81C432AF4FFA"; "bravoResourceTypeId" = "20" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "IT Konsulenter"; "location" = "Trondheim"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Vestre Rosten 69 - City Heimdal - ZipCode 7072"; "bravoDepartmentId" = "DC18771B-BADF-4305-B640-81C432AF4FFA"; "bravoResourceTypeId" = "10" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Salg"; "location" = "Trondheim"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = "NULL Address: Vestre Rosten 69 - City Heimdal - ZipCode 7072"; "bravoDepartmentId" = "DC18771B-BADF-4305-B640-81C432AF4FFA"; "bravoResourceTypeId" = "5" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Software"; "location" = "Trondheim"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Vestre Rosten 69 - City Heimdal - ZipCode 7072"; "bravoDepartmentId" = "DC18771B-BADF-4305-B640-81C432AF4FFA"; "bravoResourceTypeId" = "14" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Økonomi"; "location" = "Trondheim"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address: Vestre Rosten 69 - City Heimdal - ZipCode 7072"; "bravoDepartmentId" = "DC18771B-BADF-4305-B640-81C432AF4FFA"; "bravoResourceTypeId" = "15" }
Add-PnPListItem -List $departmentList -Values @{"Title" = "Software"; "location" = "Vietnam"; "manager" = "duong@upheadsdeveloper.onmicrosoft.com"; "introduction" = " Address:  - City  - ZipCode "; "bravoDepartmentId" = "AC8F5B65-0077-49D4-B075-651BC8A62596"; "bravoResourceTypeId" = "14" }

##Skills
$skillList = Get-PnPList -Identity $skillTitle
Add-PnPListItem -List $skillList -Values @{"Title" = "Forretningsferdigheter"; "skillType" = "SkillGroup"; "description" = ""; "evaluationType" = "" }
Add-PnPListItem -List $skillList -Values @{"Title" = "Tekniske skills"; "skillType" = "SkillGroup"; "description" = ""; "evaluationType" = "" }
Add-PnPListItem -List $skillList -Values @{"Title" = "Soft Skills"; "skillType" = "SkillGroup"; "description" = ""; "evaluationType" = "" }
Add-PnPListItem -List $skillList -Values @{"Title" = "Språk"; "skillType" = "SkillGroup"; "description" = ""; "evaluationType" = "" }
Add-PnPListItem -List $skillList -Values @{"Title" = "Utdannelse og sertifiseringer"; "skillType" = "SkillGroup"; "description" = ""; "evaluationType" = "" }
Add-PnPListItem -List $skillList -Values @{"Title" = "Erfaring"; "skillType" = "SkillGroup"; "description" = ""; "evaluationType" = "" }


##Email Templates
$emailTemplateList = Get-PnPList -Identity $emailTemplateTitle
Add-PnPListItem -List $emailTemplateList -Values @{"Title" = "Tilleggsdokumentasjon"; "emailSubject" = "Ber om tilleggsinformasjon vedr søknaden din som {JobTitle}"; "emailBody" = '<div>
<br>Dear {CandidateName},
<br>Thanks for apply to {JobTitle}.
<br>For this job specification, we would like to refer some additional documents:
<br><i>** Define document you want to ask for **</i>
<br>Please reply this email with those documents attached.
<br>If you need further assistance, please feel free to let me know.
<br>Best Regards,
<br></div>'; "systemId" = 1;
}
Add-PnPListItem -List $emailTemplateList -Values @{"Title" = "Innkalling til intervju"; "emailSubject" = "Intervju av {CandidateName}, for stillingen {JobTitle}"; "emailBody" = '<div>
<br>Hi Team,
<br>As discussed, please arrange your time to join this interview:
<br>Time: <strong>{InterviewTime}</strong>
<br>Date: <strong>{InterviewDate}</strong>
<br>Interviewer: <strong>{Interviewer}</strong>
<br>If you need further assistance, please feel free to let me know.
<br>Best Regards,</div>'; "systemId" = 2;
}
Add-PnPListItem -List $emailTemplateList -Values @{"Title" = "Send tilbud på stilling"; "emailSubject" = "Offer Information -  {CandidateName} - {JobTitle} "; "emailBody" = '<div>
<br>Dear {CandidateName},
<br>Congratulations!
<br>We are pleased to offer you the position of {JobTitle}
<br>Please reply to this email with your acceptance.
<br>Sincerely, </div>'; "systemId" = 3;
}
Add-PnPListItem -List $emailTemplateList -Values @{"Title" = "Avslag"; "emailSubject" = "Vedrørende din søknad på stilling som {JobTitle} hos Upheads"; "emailBody" = '
<div class="ExternalClass07ECB0A8CBF74D9B9AE94BC37D075A9E"><span style="color&#58;black;">​</span>
Dear {CandidateName},</div><div class="ExternalClass07ECB0A8CBF74D9B9AE94BC37D075A9E"><p>Firstly, I would like to express our gratitude towards your interest for joining our team!
While we were impressed by your qualifications, we regret to inform that we will not process your application for {JobTitle}.&#160;</p><p>This decision has no reflection on your capabilities but instead, is more about the right fit we are looking for.

We will be happy to contact you again when we have to staff other vacancies that fit better with your profile.&#160;</p><p>We wish you the best success and happiness in your work and life.&#160;</p><p>Thank you and Best Regards,<br></p></div>'; 
    "systemId" = 4;
}
Add-PnPListItem -List $emailTemplateList -Values @{"Title" = "Vurdering av kandidate - epost"; "emailSubject" = "Vennligst evaluer {CandidateName} for stillingen {JobTitle}"; "emailBody" = '
<p>Hei</p>
<p>Vennligst vurder kandidatene innen følgnede områder:
</p>
{cardContent}'; "systemId" = 5;
}
Add-PnPListItem -List $emailTemplateList -Values @{"Title" = "Onboarding-oppgaver"; "emailSubject" = "On Boarding tasks should be done before employee boarding {startDate}"; "emailBody" = '
<p>Dear Madam/Sir</p>
<p>For well preparation to new comer, I would like to suggest you complete those tasks before {startDate}</p>
{cardContent}'; "systemId" = 6;
}
Add-PnPListItem -List $emailTemplateList -Values @{"Title" = "Off Boarding"; "emailSubject" = "Off Boarding tasks should be done before employee leave on {terminationDate}"; "emailBody" = '
<p>Dear Madam/Sir</p>
<p>For security, I would like to suggest you complete those tasks before {terminationDate}</p>
{cardContent}'; "systemId" = 7;
}


Add-PnPListItem -List $emailTemplateList -Values @{"Title" = "Collect Assessment Email"; "emailSubject" = "Anmodning om tilbakemelding: Vurdering av Intervjuer for {CandidateName}-{JobTitle}"; "emailBody" = '<div style="background-color: white; border-radius: 10px; box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1); padding: 20px; text-align: center;">

<h2>Feedback Request</h2>
<p>Dear {InterviewerName},</p>
<p>We value your opinion! Please take a moment to provide feedback on the {CandidateName} for position {JobTitle}. Your input is valuable to us.</p>
<a href="{LinkToForm}" style="text-decoration: none; background-color: #4caf50; color: white; padding: 10px 20px; border-radius: 5px; margin-top: 20px; display: inline-block;">Give Feedback</a>
<p>If the link above does not work, please copy and paste the following URL into your browser:</p>
<p>{LinkToForm}</p>

<p>Thank you for your time!</p>
<p>Best regards,<br>
    Upheads AS</p>
</div>'; "systemId" = 8;
}


##Task templates
$taskChecklistList = Get-PnPList -Identity $taskCheckListTitle
Add-PnPListItem -List $taskChecklistList -Values @{"Title" = "Create a detailed onboarding plan"; "description" = "This plan should outline the tasks and activities that the new employee will need to complete during their first few weeks on the job. It should include details such as the employee's schedule, important deadlines, and any required training or orientation sessions."; "departmentId" = 0; "useFor" = "On Boarding"; }
Add-PnPListItem -List $taskChecklistList -Values @{"Title" = "Prepare the employee's workspace"; "description" = "This includes setting up the employee's workstation with necessary equipment, such as a computer, phone, and office supplies. If possible, make sure the employee has everything they need before their first day on the job."; "departmentId" = 0; "useFor" = "On Boarding"; }
Add-PnPListItem -List $taskChecklistList -Values @{"Title" = "Set up the employee's accounts and access"; "description" = "This includes creating email and computer accounts, as well as any other accounts the employee will need to access company systems or software."; "departmentId" = 0; "useFor" = "On Boarding"; }
Add-PnPListItem -List $taskChecklistList -Values @{"Title" = "Assign a mentor or buddy"; "description" = "Consider assigning an experienced employee to serve as a mentor or buddy to the new employee. This can help the new employee feel more comfortable and supported, and can also provide an opportunity for the mentor to share their knowledge and expertise."; "departmentId" = 0; "useFor" = "On Boarding"; }
Add-PnPListItem -List $taskChecklistList -Values @{"Title" = "Schedule time for introductions"; "description" = "Set up meetings or introductions with key stakeholders in the company, such as other team members, supervisors, and HR personnel. This can help the new employee start building relationships and understanding the company culture."; "departmentId" = 0; "useFor" = "On Boarding"; }
Add-PnPListItem -List $taskChecklistList -Values @{"Title" = "Prepare a welcome packet"; "description" = "Consider creating a welcome packet that includes important company policies, procedures, and benefits information. This can help the new employee feel more prepared and informed about their new job."; "departmentId" = 0; "useFor" = "On Boarding"; }
Add-PnPListItem -List $taskChecklistList -Values @{"Title" = "Send email collect more information"; "description" = " Ex: Social No, Emergency contact, etc."; "departmentId" = 0; "useFor" = "On Boarding"; }

Add-PnPListItem -List $taskChecklistList -Values @{"Title" = "Review the employee's responsibilities and tasks"; "description" = "Review the employee's current responsibilities and tasks to ensure that they are completed or transferred to other team members before they leave. It is important to ensure that all ongoing projects are properly handed over and that there are no gaps in work."; "departmentId" = 0; "useFor" = "Off Boarding"; }
Add-PnPListItem -List $taskChecklistList -Values @{"Title" = "Collect company property"; "description" = "Collect any company property that the employee may have, such as a company laptop, phone, access badges, and any other company property issued to the employee. Ensure that the employee signs off on the return of all company property and that all necessary paperwork is completed."; "departmentId" = 0; "useFor" = "Off Boarding"; }
Add-PnPListItem -List $taskChecklistList -Values @{"Title" = "Discuss any outstanding payments and benefits"; "description" = "Discuss any outstanding payments, benefits, or severance packages that may be owed to the employee. Make sure the employee understands the process for receiving these payments and benefits."; "departmentId" = 0; "useFor" = "Off Boarding"; }
Add-PnPListItem -List $taskChecklistList -Values @{"Title" = "Remove system access"; "description" = "Remove the employee's access to company systems and data to ensure that confidential information remains secure. This includes email accounts, company databases, and other systems that the employee may have had access to."; "departmentId" = 0; "useFor" = "Off Boarding"; }
Add-PnPListItem -List $taskChecklistList -Values @{"Title" = "Update HR records"; "description" = "Update HR records and ensure that all necessary paperwork is completed, such as exit interview forms and any other documentation related to the employee's departure."; "departmentId" = 0; "useFor" = "Off Boarding"; }
Add-PnPListItem -List $taskChecklistList -Values @{"Title" = "Communicate the employee's departure"; "description" = "Communicate the employee's departure to other team members and stakeholders, as appropriate. This can include an announcement email, a farewell party, or other forms of recognition or communication."; "departmentId" = 0; "useFor" = "Off Boarding"; }
Add-PnPListItem -List $taskChecklistList -Values @{"Title" = "Conduct an exit interview"; "description" = "Conduct an exit interview to gather feedback from the employee and identify areas for improvement. This can help the company understand the reasons for the employee's departure and identify opportunities to improve the employee experience."; "departmentId" = 0; "useFor" = "Off Boarding"; }

##Recruitment Posts
$recruitmentPostList = Get-PnPList -Identity $recruitmentPostTitle
Add-PnPListItem -List $recruitmentPostList -Values @{"Title" = "IT-konsulent"; "content" = '<p><strong>Upheads leter etter flere gode kollegaer til v&aring;r konsulentavdeling i Sandnes. N&aring; h&aring;per vi &aring; finne deg som har en genuin interesse for teknologi og som kan bli en del av gjengen!</strong></p>
<p>&nbsp;</p>
<p>Stillingen passer for deg som har 3-5 &aring;rs erfaring innen IT og teknologi og som &oslash;nsker &aring; bygge kompetanse p&aring; Microsoft sin plattform. Vi &oslash;nsker at du er glad i &aring; jobbe med mennesker ettersom stillingen er kunderettet. I retur stiller vi et skikkelig godt arbeidsmilj&oslash; og kollegaer som vi er veldig stolte av.</p>
<p>Du vil f&aring; anledning til &aring; utvikle din faglige kompetanse og vil delta i spennende prosjekter. Vi er spesielt gode p&aring; helsesektoren og jobber med lege- og tannklinikker over hele Norge. V&aring;re arbeidsdager er varierte og vil gi deg kompetanse p&aring; flere omr&aring;der.</p>
<p>&nbsp;</p>
<p><strong>Vi tilbyr:</strong></p>
<ul>
<li>Godt arbeidsmilj&oslash; med 93% medarbeidertilfredshet!</li>
<li>En trygg arbeidsplass med gode utviklingsmuligheter</li>
<li>Konkurransedyktig l&oslash;nn</li>
<li>170 flinke kollegaer og stort fagmilj&oslash;</li>
<li>Spennende kunder</li>
<li>Gode utviklingsmuligheter</li>
<li>Kurs og sertifiseringer</li>
<li>Flotte kontorlokaler p&aring; Forus</li>
<li>Firmaturer til utlandet og andre kjekke arrangementer gjennom &aring;ret</li>
<li>Konkurransedyktige pensjon og forsikringsordninger</li>
<li>Eget Esport lag (www.twitch.tv/upheads)</li>
<li>Tur til utlandet annenhvert &aring;r</li>
<li>Nevnte vi godt arbeidsmilj&oslash;...?</li>
</ul>
<div class="import-decoration" data-controller="scrollStartTracking" data-ec-track="scroll-mid-classified" data-adobe-track="navigation.scroll-mid-classified.scroll">
<section class="panel">
<p><strong>Arbeidsoppgaver:</strong></p>
<ul>
<li>Arbeid med kundel&oslash;sninger</li>
<li>Server / Klient l&oslash;sninger</li>
<li>Planlegge fremtiden i Azure</li>
<li>Automatisere installasjon av programmer via Intune</li>
<li>Implementere og utvikle l&oslash;sninger</li>
<li>Administrasjon og drift</li>
<li>Ansvar for dedikerte kunder</li>
<li>Bidra til kompetanseoverf&oslash;ring</li>
</ul>
<p>&nbsp;</p>
<p><strong>&Oslash;nskede kvalifikasjoner:</strong></p>
<ul>
<li>Du elsker teknologi!</li>
<li>Du b&aring;de &oslash;nsker og evner &aring; tilegne deg ny kompetanse</li>
<li>Det er s&aelig;rlig viktig for stillingen at du er l&oslash;sningsorientert og har stor gjennomf&oslash;ringsevne</li>
<li>3-5 &aring;rs relevant arbeidserfaring innen IT</li>
<li>Du har motivasjon for &aring; ta sertifiseringer</li>
<li>Du er en lagspiller som er serviceinnstilt og omgjengelig</li>
<li>Du kan jobbe b&aring;de selvstendig og i team</li>
<li>Du har gode kommunikasjonsevner, b&aring;de skriftlig og muntlig</li>
</ul>
</section>
</div>
<div data-controller="elementInViewTracking" data-ec-track="scroll-bottom-classified" data-adobe-track="navigation.scroll-bottom-classified.scroll">&nbsp;</div>
<section class="panel">
<div>
<h2 class="u-t3">Om arbeidsgiveren</h2>
<p>Upheads lager sikre IT-l&oslash;sninger for sm&aring; og mellomstore bedrifter over hele Norge. Vi tror p&aring; det personlige, enten du trenger hjelp til IT-sikkerhet, skytjenester eller digitalisering.<br><br>Derfor f&aring;r du tildelt din helt egne Marie (eller Anders, eller Magne) som kjenner din IT-l&oslash;sning inn og ut.<br><br>Du finner oss i Bergen, Haugesund, Oslo, Oslofjord, Sandnes (hovedkontor) og Trondheim.</p>
</div>
</section>' }
Add-PnPListItem -List $recruitmentPostList -Values @{"Title" = "Servicedesk Konsulent"; "content" = '<div class="import-decoration" data-controller="scrollStartTracking" data-ec-track="scroll-mid-classified" data-adobe-track="navigation.scroll-mid-classified.scroll">
<section class="panel">
<p><strong>Som konsulent p&aring; v&aring;r Servicedesk kan du bety en stor forskjell for en haug av mennesker. En kunde som ikke f&aring;r logget seg p&aring; PC-en sin, en tannlege som sliter med &aring; lagre r&oslash;ntgenbilder eller en fortvilet butikkarbeider med en kortterminal som er nede.</strong></p>
<p><strong>&nbsp;</strong></p>
<p>Vi er gjengen som forst&aring;r at ikke hele Norge har doktorgrad i verken data eller Microsoft. Gjengen som m&oslash;ter kundene gjennom arbeidsdagen og som er ansiktet til Upheads utad.</p>
<p>&nbsp;</p>
<p>I dag best&aring;r v&aring;r Servicedesk av 35 kollegaer som tar saken uansett hvor utfordrende eller enkel den m&aring;tte v&aelig;re. Vi har &aring;pningstid fra kl. 07:00 &ndash; 21:00 alle hverdager. Vi har oppl&aelig;ringsl&oslash;p, intern kommunikasjon og milj&oslash; som gj&oslash;r at du ikke trenger &aring; v&aelig;re et teknisk geni for &aring; trives p&aring; jobb. Derimot b&oslash;r du v&aelig;re l&oslash;sningsorientert og god p&aring; &aring; f&oslash;re samtaler.&nbsp;</p>
<p>&nbsp;</p>
<p>I 2022 vant Servicedesk pris for "&Aring;rets Avdeling". Det vil si at det er en avdeling som betyr mye for b&aring;de kunder og kollegaer, har et godt milj&oslash; og er en gjeng som vi i Upheads er veldig stolte av.</p>
<p>&nbsp;</p>
<p>Starter du hos oss skal vi passe p&aring; at du f&aring;r utviklet din faglige kompetanse, og ved behov eller &oslash;nske, f&aring; delta i spennende prosjekter ute hos v&aring;re kunder.</p>
<p>&nbsp;</p>
<p><strong>Arbeidsoppgaver:</strong></p>
<ul>
<li>Besvare henvendelser over telefon og e-post</li>
<li>Innkomne saker fra kunder blir enten l&oslash;st av deg, eller delegert videre til v&aring;re IT-konsulenter</li>
<li>Registrere saker i v&aring;rt interne system</li>
<li>Du vil behandle ulike driftsoppgaver</li>
<li>Bestille og behandle hardware/software til v&aring;re kunder</li>
</ul>
<p>&nbsp;</p>
<p><strong>&Oslash;nskede kvalifikasjoner:</strong></p>
<ul>
<li>Har stor interesse for teknologi</li>
<li>Du er gjerne nyutdannet innen IKT-servicefaget med fagbrev</li>
<li>Arbeidserfaring kan gj&oslash;re opp for manglende utdanning</li>
<li>Erfaring fra kundesupport er et pluss!</li>
</ul>
<p>&nbsp;</p>
<p><strong>Personlige egenskaper:</strong></p>
<ul>
<li>Vi leter etter deg som er l&oslash;sningsorientert, serviceinnstilt og omgjengelig</li>
<li>Du kan jobbe b&aring;de selvstendig og i team</li>
<li>Gode norskkunnskaper, b&aring;de skriftlig og muntlig</li>
<li>Hos oss er det stor aktivitet, og du m&aring; trives med et h&oslash;yt arbeidstempo og &aring; sitte i et &aring;pent landskap med mange kollegaer</li>
</ul>
<p>&nbsp;</p>
<p><strong>Vi tilbyr:</strong></p>
<ul>
<li>Godt arbeidsmilj&oslash;!</li>
<li>Varierte arbeidsoppgaver</li>
<li>170 flinke kollegaer og stort fagmilj&oslash;</li>
<li>Spennende kunder</li>
<li>Gode utviklingsmuligheter</li>
<li>Kurs og sertifiseringer</li>
<li>Firmaturer til utlandet og andre kjekke arrangementer gjennom &aring;ret</li>
<li>Eget Esport lag (www.twitch.tv/upheads)</li>
<li>Nevnte vi godt arbeidsmilj&oslash;...?</li>
</ul>
<p>&nbsp;</p>
<p><strong>Lurer du p&aring; hvordan det er &aring; jobbe i Upheads? Sjekk denne videoen!</strong></p>
<p>https://youtube.com/shorts/-A4ZxKQrrUk</p>
</section>
</div>
<div data-controller="elementInViewTracking" data-ec-track="scroll-bottom-classified" data-adobe-track="navigation.scroll-bottom-classified.scroll">&nbsp;</div>
<section class="panel">
<div>
<h2 class="u-t3">Om arbeidsgiveren</h2>
<p>I Upheads hjelper vi deg med alt din bedrift m&aring;tte trenge innen IT. L&oslash;sningen skreddersys for deg og du f&aring;r tilgang p&aring; v&aring;r solide IT-kompetanse, personlig oppf&oslash;lging og proaktive konsulenter.<br><br>Vi er en engasjert, im&oslash;tekommende og kompetent gjeng som i dag teller vi hele 130 kloke hoder. Du finner oss i Bergen, Drammen, Haugesund, Oslo, Oslofjord, Sandnes (hovedkontor) og Trondheim.<br><br>Vi holder oss oppdaterte med kurs og sertifiseringer slik at vi, sammen med v&aring;re tjenester og produkter, s&oslash;rger for at v&aring;re kunder f&aring;r en problemfri IT-hverdag.<br><br>I Upheads bruker vi uttrykket &ldquo;IT med mening&rdquo;. Det betyr at det vi holder p&aring; med skal oppleves meningsfullt, b&aring;de for v&aring;re kunder, medarbeidere og samarbeidspartnere. For oss ansatte betyr &ldquo;IT med mening&rdquo; en trygg, &aelig;rlig og &aring;pen arbeidsplass. Upheads skal v&aelig;re et sted hvor du f&aring;r utvikle deg og hvor folk trives!</p>
</div>
</section>'}


##Recruitments
$recruitmentList = Get-PnPList -Identity $recruitmentTitle
Add-PnPListItem -List $recruitmentList -Values @{"Title" = "Consultant for Oslo"; "requireSkills" = "1;#3;#6"; "optionalSkills" = "4;#5"; "departmentId" = "2"; "description" = "Our working days are varied and will give you expertise in several specialist areas."; "fromDate" = "2022-01-01"; "endDate" = "2022-12-31" }
Add-PnPListItem -List $recruitmentList -Values @{"Title" = "Servicedesk for Oslo"; "requireSkills" = "1;#3;#6"; "optionalSkills" = "4;#5"; "departmentId" = "2"; "description" = "Our working days are varied and will give you expertise in several specialist areas."; "fromDate" = "2022-01-01"; "endDate" = "2022-12-31" }
Add-PnPListItem -List $recruitmentList -Values @{"Title" = "IT for Sandness"; "requireSkills" = "2"; "optionalSkills" = "1"; "departmentId" = "1"; "description" = "Our working days are varied and will give you expertise in several specialist areas."; "fromDate" = "2022-10-10"; "endDate" = "2022-12-3" }
Add-PnPListItem -List $recruitmentList -Values @{"Title" = "IT for Stokke Fjord"; "requireSkills" = "2"; "optionalSkills" = "1"; "departmentId" = "3"; "description" = "Our working days are varied and will give you expertise in several specialist areas."; "fromDate" = "2022-10-15"; "endDate" = "2022-11-15" }
Add-PnPListItem -List $recruitmentList -Values @{"Title" = "Sale Manager for Oslo"; "requireSkills" = "6"; "optionalSkills" = "1"; "departmentId" = "2"; "description" = "Our working days are varied and will give you expertise in several specialist areas."; "fromDate" = "2022-01-01"; "endDate" = "2022-10-31" }

##Candidates
$candidateList = Get-PnPList -Identity $candidateTitle
$candidateFolderList = Get-PnPList -Identity $candidateFolderTitle
$interviewList = Get-PnPList -Identity $interviewTitle

$Title = "John Patrick"
$lastName = "Patrick"
$firstName = "John"
$i = Add-PnPListItem -List $candidateList  -Values @{"Title" = $Title; "firstName" = $firstName; "lastName" = $lastName; "candidatePhone" = "0857.10.8668"; "candidateEmail" = "John.Patrick@gmail.com"; "personalLink" = "https://www.linkedin.com/in/john97/"; "candidateLogs" = "Make a phone call" }
$Item = Get-PnPListItem -List $candidateList -Id $i.Id

#Get the File and Add to List Item Attachment
$FilePath = ".\PSScripts\Resumes\JohnPatrick.pdf"
$FileStream = New-Object IO.FileStream($FilePath, [System.IO.FileMode]::Open)
$AttachmentInfo = New-Object -TypeName Microsoft.SharePoint.Client.AttachmentCreationInformation
$AttachmentInfo.FileName = Split-Path $FilePath -Leaf
$AttachmentInfo.ContentStream = $FileStream
$AttachedFile = $Item.AttachmentFiles.Add($AttachmentInfo)
Invoke-PnPQuery
$FileStream.Close()

$docsetUrl = Add-PnPDocumentSet -List $candidateFolderList -ContentType $ContentTypeName -Name ($Title + " - Consultant for Oslo")
$docset = Get-PnPFolder -Url $docsetUrl 
$docset = Get-PnPProperty $docset -Property "ListItemAllFields"
Set-PnPListItem -List $candidateFolderList -Identity $docset.Id -Values @{"Title" = $Title; "recruitmentId" = 1; "candidateId" = $Item.Id; "candidateStatus" = "In-progress" }
Add-PnPFile -Path .\PSScripts\Resumes\JohnPatrick.pdf -Folder $docsetUrl -Values @{"Title" = $Title; "docType" = "Curriculum Vitae"; }

##
$Title = "Uyen Do"
$lastName = "Do"
$firstName = "Uyen"
$i = Add-PnPListItem -List $candidateList  -Values @{"Title" = $Title; "firstName" = $firstName; "lastName" = $lastName; "candidatePhone" = "0788.90.8668"; "candidateEmail" = "Uyen.Do@hotmail.com"; "personalLink" = "https://www.linkedin.com/in/uyendo939/"; "candidateLogs" = "Add interview" }

$Item = Get-PnPListItem -List $candidateList -Id $i.Id

#Get the File and Add to List Item Attachment
$FilePath = ".\PSScripts\Resumes\UyenDo.pdf"
$FileStream = New-Object IO.FileStream($FilePath, [System.IO.FileMode]::Open)
$AttachmentInfo = New-Object -TypeName Microsoft.SharePoint.Client.AttachmentCreationInformation
$AttachmentInfo.FileName = Split-Path $FilePath -Leaf
$AttachmentInfo.ContentStream = $FileStream
$AttachedFile = $Item.AttachmentFiles.Add($AttachmentInfo)
Invoke-PnPQuery
$FileStream.Close()

$docsetUrl = Add-PnPDocumentSet -List $candidateFolderList -ContentType $ContentTypeName -Name ($Title + " - IT for Sandness")
$docset = Get-PnPFolder -Url $docsetUrl 
$docset = Get-PnPProperty $docset -Property "ListItemAllFields"
Set-PnPListItem -List $candidateFolderList -Identity $docset.Id -Values @{"Title" = $Title; "recruitmentId" = 3; "candidateId" = $i.Id; "candidateStatus" = "Interviewing" ; "DocumentSetDescription" = "Can speak French"; }
Add-PnPFile -Path .\PSScripts\Resumes\UyenDo.pdf -Folder $docsetUrl -Values @{"Title" = $Title; "docType" = "Curriculum Vitae"; }
Add-PnPListItem -List $interviewList -Values @{"Title" = $Title; "applicantId" = $docset.Id; "interviewOrder" = 1; "interviewStartDate" = "2022-11-02"; "interviewer" = "duong@upheadsdeveloper.onmicrosoft.com"; "interviewStatus" = "Interviewing" }

#Competitor with Uyen Do

$Title = "Hoa Nguyen"
$lastName = "Nguyen"
$firstName = "Hoa"
$i = Add-PnPListItem -List $candidateList  -Values @{"Title" = $Title; "firstName" = $firstName; "lastName" = $lastName; "candidatePhone" = "07889.90.8668"; "candidateEmail" = "hoa.nguyen@gmail.com"; "personalLink" = "https://www.linkedin.com/in/hoanguyen993/"; "candidateLogs" = "Add interview" }

$Item = Get-PnPListItem -List $candidateList -Id $i.Id

#Get the File and Add to List Item Attachment
$FilePath = ".\PSScripts\Resumes\HoaNguyen.pdf"
$FileStream = New-Object IO.FileStream($FilePath, [System.IO.FileMode]::Open)
$AttachmentInfo = New-Object -TypeName Microsoft.SharePoint.Client.AttachmentCreationInformation
$AttachmentInfo.FileName = Split-Path $FilePath -Leaf
$AttachmentInfo.ContentStream = $FileStream
$AttachedFile = $Item.AttachmentFiles.Add($AttachmentInfo)
Invoke-PnPQuery
$FileStream.Close()

$docsetUrl = Add-PnPDocumentSet -List $candidateFolderList -ContentType $ContentTypeName -Name ($Title + " - IT for Sandness")
$docset = Get-PnPFolder -Url $docsetUrl 
$docset = Get-PnPProperty $docset -Property "ListItemAllFields"
Set-PnPListItem -List $candidateFolderList -Identity $docset.Id -Values @{"Title" = $Title; "recruitmentId" = 3; "candidateId" = $i.Id; "candidateStatus" = "Interviewing" ; "DocumentSetDescription" = "Can speak 3 languages"; }
Add-PnPFile -Path .\PSScripts\Resumes\HoaNguyen.pdf -Folder $docsetUrl -Values @{"Title" = $Title; "docType" = "Curriculum Vitae"; }
Add-PnPListItem -List $interviewList -Values @{"Title" = $Title; "applicantId" = $docset.Id; "interviewOrder" = 1; "interviewStartDate" = "2022-11-02"; "interviewer" = "duong@upheadsdeveloper.onmicrosoft.com"; "interviewStatus" = "Interviewing" }


#This person apply 2 positions
$Title = "Sandra Maxwell"
$lastName = "Maxwell"
$firstName = "Sandra"
$i = Add-PnPListItem -List $candidateList  -Values @{"Title" = $Title; "firstName" = $firstName; "lastName" = $lastName; "candidatePhone" = "0783.97.8668"; "candidateEmail" = "Sandra.Maxwell@yahoo.com"; "personalLink" = "https://www.linkedin.com/in/sandra9348/"; "candidateLogs" = "Add interview" }

$Item = Get-PnPListItem -List $candidateList -Id $i.Id
#Get the File and Add to List Item Attachment
$FilePath = ".\PSScripts\Resumes\SandraMaxwell.pdf"
$FileStream = New-Object IO.FileStream($FilePath, [System.IO.FileMode]::Open)
$AttachmentInfo = New-Object -TypeName Microsoft.SharePoint.Client.AttachmentCreationInformation
$AttachmentInfo.FileName = Split-Path $FilePath -Leaf
$AttachmentInfo.ContentStream = $FileStream
$AttachedFile = $Item.AttachmentFiles.Add($AttachmentInfo)
Invoke-PnPQuery
$FileStream.Close()

$docsetUrl = Add-PnPDocumentSet -List $candidateFolderList -ContentType $ContentTypeName -Name ($Title + " - Consultant for Oslo")
$docset = Get-PnPFolder -Url $docsetUrl 
$docset = Get-PnPProperty $docset -Property "ListItemAllFields"
Set-PnPListItem -List $candidateFolderList -Identity $docset.Id -Values @{"Title" = $Title; "recruitmentId" = 1 ; "candidateId" = $i.Id; "candidateStatus" = "Interviewing"; "DocumentSetDescription" = "Smart and friendly" }
Add-PnPFile -Path .\PSScripts\Resumes\SandraMaxwell.pdf -Folder $docsetUrl -Values @{"Title" = $Title; "docType" = "Curriculum Vitae"; }
Add-PnPListItem -List $interviewList -Values @{"Title" = $Title; "applicantId" = $docset.Id; "interviewOrder" = 1; "interviewStartDate" = "2022-11-01"; "interviewer" = "tan.hoang.nguyen@upheadsdeveloper.onmicrosoft.com"; "interviewStatus" = "Done" }
Add-PnPListItem -List $interviewList -Values @{"Title" = $Title; "applicantId" = $docset.Id; "interviewOrder" = 2; "interviewStartDate" = "2022-11-07"; "interviewer" = "duong@upheadsdeveloper.onmicrosoft.com", "admin@upheadsdeveloper.onmicrosoft.com"; "interviewStatus" = "WaitingFeedback" }


$docsetUrl = Add-PnPDocumentSet -List $candidateFolderList -ContentType $ContentTypeName -Name ($Title + " - Servicedesk for Oslo")
$docset = Get-PnPFolder -Url $docsetUrl 
$docset = Get-PnPProperty $docset -Property "ListItemAllFields"
Set-PnPListItem -List $candidateFolderList -Identity $docset.Id -Values @{"Title" = $Title; "recruitmentId" = 2 ; "candidateId" = $i.Id; "candidateStatus" = "Interviewing"; "DocumentSetDescription" = "Smart and friendly"; }
Add-PnPFile -Path .\PSScripts\Resumes\SandraMaxwell.pdf -Folder $docsetUrl -Values @{"Title" = $Title; "docType" = "Curriculum Vitae"; }
Add-PnPListItem -List $interviewList -Values @{"Title" = $Title; "applicantId" = $docset.Id; "interviewOrder" = 1; "interviewStartDate" = "2022-11-01"; "interviewer" = "tan.hoang.nguyen@upheadsdeveloper.onmicrosoft.com"; "interviewStatus" = "Done" }
    
##Setup tags
$candidateTagsList = Get-PnPList -Identity $candidateTagsTitle
Add-PnPListItem -List $candidateTagsList -Values @{"Title" = "Ja"; "index" = 1; "color" = '#28a745'}
Add-PnPListItem -List $candidateTagsList -Values @{"Title" = "Nei"; "index" = 2; "color" = '#b02a37'}
Add-PnPListItem -List $candidateTagsList -Values @{"Title" = "Kanskje"; "index" = 3; "color" = '#6c757d'}
Add-PnPListItem -List $candidateTagsList -Values @{"Title" = "Ingen"; "index" = 4; "color" = '#fff'}

