from django import forms
from django.forms import extras
from django.contrib.auth.forms import UserCreationForm
from django.db import transaction
import datetime

from person_system.models import User

BIRTH_Y_CHOICES = ('1980', '1981', '1982', '1983', '1984')
BIRTH_M_CHOICES = ('01', '02', '03', '04', '05')
BIRTH_DAY_CHOICES = ('01', '02', '03', '04', '05')

class SignForm(UserCreationForm):
    lastname = forms.CharField()
    firstname = forms.CharField()
    email = forms.EmailField()
    address = forms.CharField()
    cur_year = datetime.datetime.today().year
    year_range = tuple([i for i in range(cur_year - 20, cur_year + 2)])
    birthday = forms.DateField(initial=datetime.date.today() - datetime.timedelta(days=7),widget=(forms.SelectDateWidget(years=year_range)) )


    class Mete(UserCreationForm.Meta):
        model = User
