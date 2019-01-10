from django.contrib import admin
from person_system.models import User, School, Classes, Course
# Register your models here.

class UserAdmin(admin.ModelAdmin):
    list_display = ('__str__', 'email',  'is_active', 'is_student', 'is_teacher')
    list_filter = ('is_student', 'is_teacher', 'is_active')
    search_fields = ('__str__', )

class SchoolAdmin(admin.ModelAdmin):
    list_display = ('name', 'address', 'city')
    search_fields = ('name', 'city')

class CourseAdmin(admin.ModelAdmin):
    list_display = ('name', 'price', 'outline')
    search_fields = ('name', )

class ClassesAdmin(admin.ModelAdmin):
    list_display = ('name', 'course', 'start_time')
    search_fields = ('course__name',)


admin.site.register(User, UserAdmin)
admin.site.register(School, SchoolAdmin)
admin.site.register(Course, CourseAdmin)
admin.site.register(Classes, ClassesAdmin)
