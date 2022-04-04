package services;

public class Recruiter {
    int id;
    String Company, Location, Incharge, Email, Contact, Domain, Password;

    public Recruiter(){
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
    public String getDomain() {
        return this.Domain;
    }
    public String getPassword() {
        return this.Password;
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
    public void setDomain(String Domain) {
        this.Domain = Domain;
    }
    public void setPassword(String Password) {
        this.Password = Password;
    }
}
