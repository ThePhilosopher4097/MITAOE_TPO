package services;

public class Applicant {
    int id;
    String PRN, Name, Address, Branch, Email, Contact, Batch, Password;

    public Applicant(){
        super();
    }
    public int getId() {
        return this.id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getPRN() {
        return this.PRN;
    }
    public String getName() {
        return this.Name;
    }
    public String getAddress() {
        return this.Address;
    }
    public String getBranch() {
        return this.Branch;
    }
    public String getEmail() {
        return this.Email;
    }
    public String getContact() {
        return this.Contact;
    }
    public String getBatch() {
        return this.Batch;
    }
    public String getPassword() {
        return this.Password;
    }
    public void setPRN(String PRN) {
        this.PRN = PRN;
    }
    public void setName(String Name) {
        this.Name = Name;
    }
    public void setAddress(String Address) {
        this.Address = Address;
    }
    public void setBranch(String Branch) {
        this.Branch = Branch;
    }
    public void setEmail(String Email) {
        this.Email = Email;
    }
    public void setContact(String Contact) {
        this.Contact = Contact;
    }
    public void setBatch(String Batch) {
        this.Batch = Batch;
    }
    public void setPassword(String Password) {
        this.Password = Password;
    }
}
