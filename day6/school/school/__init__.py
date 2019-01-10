import pymysql
pymysql.install_as_MySQLdb()


def calculate_age(self):
    import datetime
    birth = self.birthday
    tod = datetime.date.today()
    age = (tod.year - birth.year) - int((tod.month, tod.day) < (birth.month, birth.day))
    return age