from django.db import models
from django import forms

class Ratings(models.Model):
    rating = models.IntegerField()
    name = models.CharField(max_length=255)
    comments = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    status = models.BooleanField(default=True)

    def __str__(self):
        return self.name


class AcademicProgram(models.Model):
    iconName = models.CharField(max_length=255)
    iconSize = models.IntegerField()
    iconType = models.CharField(max_length=50)
    title = models.CharField(max_length=50)
    description = models.TextField()

    def __str__(self):
        return self.title


class Role(models.Model):
    title = models.CharField(max_length=10)

    def __str__(self):
        return self.title


class Menu(models.Model):
    menu_ID = models.CharField(max_length=30)
    div_ID = models.CharField(max_length=30)
    icon = models.CharField(max_length=100)
    title = models.CharField(max_length=30)
    span = models.CharField(max_length=200)

    def __str__(self):
        return self.title


class Access(models.Model):
    role = models.ForeignKey(Role, on_delete=models.CASCADE)
    menu = models.ForeignKey(Menu, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.role} - {self.menu}"


class Contact(models.Model):
    name = models.CharField(max_length=50)
    icon = models.CharField(max_length=100)
    text = models.CharField(max_length=255, blank=True)
    link = models.CharField(max_length=255, blank=True)

    def __str__(self):
        return self.name


class Department(models.Model):
    icon = models.CharField(max_length=255)
    title = models.CharField(max_length=50)

    def __str__(self):
        return self.title


class Expired(models.Model):
    batch = models.IntegerField()
    year = models.IntegerField()
    start_date = models.DateField()
    expired_date = models.DateField()
    start_class = models.DateField()

    def __str__(self):
        return f"Batch: {self.batch}, Year: {self.year}"


class FormReg(models.Model):
    form = models.BooleanField(default=True)

    def __str__(self):
        return str(self.form)


class Level(models.Model):
    title = models.CharField(max_length=255)

    def __str__(self):
        return self.title


class Major(models.Model):
    title = models.CharField(max_length=50)
    description = models.TextField()
    department = models.ForeignKey(Department, on_delete=models.CASCADE)

    def __str__(self):
        return self.title

class Subject(models.Model):
    title = models.ForeignKey(Major, on_delete=models.CASCADE)
    level = models.ForeignKey(Level, on_delete=models.CASCADE, limit_choices_to={'department__level': models.F('level')})

    def __str__(self):
        return f"Level: {self.level}, Major: {self.title}"
    
class Married(models.Model):
    title = models.CharField(max_length=255)

    def __str__(self):
        return self.title


class Payment(models.Model):
    title = models.CharField(max_length=255)

    def __str__(self):
        return self.title


class Relationship(models.Model):
    title = models.CharField(max_length=255)

    def __str__(self):
        return self.title


class Subscribe(models.Model):
    name = models.CharField(max_length=30)
    email = models.EmailField()
    subscribe_date = models.DateTimeField()
    status = models.CharField(max_length=10, default='Active')

    def __str__(self):
        return self.name


class TuitionFee(models.Model):
    level = models.ForeignKey(Level, on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    description = models.TextField(blank=True)

    def __str__(self):
        return f"Level: {self.level}, Price: {self.price}"


class Status(models.Model):
    title = models.CharField(max_length=10)

    def __str__(self):
        return self.title


class Shift(models.Model):
    title = models.CharField(max_length=255)

    def __str__(self):
        return self.title


class Sex(models.Model):
    title = models.CharField(max_length=255)

    def __str__(self):
        return self.title


class Register(models.Model):
    Batch = models.IntegerField()
    Ref = models.CharField(max_length=30)
    Photo = models.CharField(max_length=255)
    First_Name_Kh = models.CharField(max_length=255)
    Last_Name_Kh = models.CharField(max_length=255)
    First_Name_En = models.CharField(max_length=255)
    Last_Name_En = models.CharField(max_length=255)
    Sex = models.ForeignKey(Sex, on_delete=models.CASCADE)
    Village_POB = models.CharField(max_length=255)
    Commune_POB = models.CharField(max_length=255)
    District_POB = models.CharField(max_length=255)
    Province_POB = models.CharField(max_length=255)
    DOB = models.DateField()
    Village_Current = models.CharField(max_length=255)
    Commune_Current = models.CharField(max_length=255)
    District_Current = models.CharField(max_length=255)
    Province_Current = models.CharField(max_length=255)
    Nationality = models.CharField(max_length=255)
    Father_Name = models.CharField(max_length=255)
    Father_Tel = models.CharField(max_length=20)
    Mother_Name = models.CharField(max_length=255)
    Mother_Tel = models.CharField(max_length=20)
    Marital_Status = models.ForeignKey(Married, on_delete=models.CASCADE)
    Emergency_Contact_Name = models.CharField(max_length=255)
    Emergency_Contact_Relation = models.ForeignKey(Relationship, on_delete=models.CASCADE)
    Emergency_Contact_Tel = models.CharField(max_length=20)
    Apply_For = models.ForeignKey(Level, on_delete=models.CASCADE)
    Major = models.ForeignKey(Major, on_delete=models.CASCADE)
    Shift = models.ForeignKey(Shift, on_delete=models.CASCADE)
    Tel = models.CharField(max_length=30)
    Email = models.CharField(max_length=100)
    Payment_Method = models.ForeignKey(Payment, on_delete=models.CASCADE)
    Diploma_Certificate = models.CharField(max_length=255)
    Student_ID = models.CharField(max_length=255)
    Khmer_ID = models.CharField(max_length=255)
    Submit_Date = models.DateTimeField(auto_now_add=True)
    Status = models.CharField(Status, max_length=10)
    Decided_By = models.CharField(max_length=30, null=True)
    Decided_Date = models.DateTimeField()
    Reason = models.TextField(null=True)

    def __str__(self):
        return f"ID: {self.id}, Ref: {self.Ref}, Ref: {self.Last_Name_En} {self.First_Name_En}, Ref: {self.Major}"