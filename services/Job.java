package services;

public class Job {
    int id;
    String Company, Location, Incharge, Email, Contact, JobTitle, JobDescription, Renumeration, JobPostedDate;

    public Job(){
        super();
    }
    public int getId() {
        return this.id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getCompany() {
        return this.Company;
    }
    public String getLocation() {
        return this.Location;
    }
    public String getIncharge() {
        return this.Incharge;
    }
    public String getEmail() {
        return this.Email;
    }
    public String getContact() {
        return this.Contact;
    }
    public String getJobTitle() {
        return this.JobTitle;
    }
    public String getJobDescription() {
        return this.JobDescription;
    }
    public String getRenumeration() {
        return this.Renumeration;
    }
    public String getJobPostedDate() {
        return this.JobPostedDate;
    }
    public void setCompany(String Company) {
        this.Company = Company;
    }
    public void setLocation(String Location) {
        this.Location = Location;
    }
    public void setIncharge(String Incharge) {
        this.Incharge = Incharge;
    }
    public void setEmail(String Email) {
        this.Email = Email;
    }
    public void setContact(String Contact) {
        this.Contact = Contact;
    }
    public void setJobTitle(String JobTitle) {
        this.JobTitle = JobTitle;
    }
    public void setJobDescription(String JobDescription) {
        this.JobDescription = JobDescription;
    }
    public void setRenumeration(String Renumeration) {
        this.Renumeration = Renumeration;
    }
    public void setJobPostedDate(String JobPostedDate) {
        this.JobPostedDate = JobPostedDate;
    }
}
