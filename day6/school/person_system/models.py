from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

class User(AbstractUser):
    birthday = models.DateField(null=True)
    address = models.CharField(max_length=256, null=True)
    is_student = models.BooleanField(default=True)
    is_teacher = models.BooleanField(default=False)

    def __str__(self):
        return self.last_name + self.first_name


class School(models.Model):
    name = models.CharField(max_length=128)
    address = models.CharField(max_length=256)
    city = models.CharField(max_length=256)

    def __str__(self):
        return self.name

class Course(models.Model):
    name = models.CharField(max_length=128)
    price = models.PositiveIntegerField()
    outline = models.DurationField()

    def __str__(self):
        return self.name

class Classes(models.Model):
    name = models.CharField(max_length=128)
    course = models.ForeignKey(Course)
    start_time = models.DateField()
    teacher = models.ForeignKey(User, limit_choices_to={'is_teacher': True}, null=True)

    def __str__(self):
        return self.name

class ClassesToStudent(models.Model):
    class_id = models.ForeignKey(Classes)
    student_id = models.ForeignKey(User)

class ClassToTeacher(models.Model):
    class_id = models.ForeignKey(Classes)
    teacher_id = models.ForeignKey(User)



