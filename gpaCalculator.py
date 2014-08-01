#!/usr/bin/python

#Get Course Name
#Get Credit Hours
#Get Grade
#Grade Points = CreditHours * Grade
#GPA = GradePoints / CreditHours

alpha = ['A', 'a', 'A+', 'a+']
alphaMinus = ['A-', 'a-']
betaPlus = ['B+', 'b+']
beta = ['B', 'b']
betaMinus = ['B-', 'b-']
charliePlus = ['C+', 'c+']
charlie = ['C', 'c']
charlieMinus = ['C-', 'c-']
deltaPlus = ['D+', 'd+']
delta = ['D', 'd']
deltaMinus = ['D-', 'd-']



def main():
	cont = True
	courses = []
	totalCredits = 0
	totalPoints = 0

	setting = int(raw_input('Would you like to: \n(1) Calculate your current gpa. \n(2) Determine what your expected gpa will be.\n'))

	if (setting == 1):
		calculateGPA()	
	elif (setting == 2):
		estimateGPA()
	#Receive Input from the user, and add it to a list of dictionaries
	#while(cont):
	#	name = raw_input('Enter the course name: ')
	#	credits = int(raw_input('How many credits is this course: '))
	#	totalCredits = totalCredits + credits
	#	grade = raw_input('What was the letter grade for the course (Include + or -): ')
	#	gradePoints = calculatePoints(grade)*credits
	#	totalPoints = totalPoints + gradePoints
	#	course = {'Course': name, 'Credits': credits, 'GradePoints': gradePoints}
	#	courses.append(course)
	#	status = raw_input('Would you like to enter another class? (y/n): ')
	#	if (status == 'n' or status == 'N'):
	#		cont = False

	#gpa = totalPoints / totalCredits
	#print ('Your gpa is a: ' + str(gpa))
	#for course in courses:
	#		print(course)
#ToD0
def calculateGPA():
	cont = True
	courses = []
	totalCredits = 0
	totalPoints = 0

	#Receive Input from the user, and add it to a list of dictionaries
	while(cont):
		name = raw_input('Enter the course name: ')
		credits = int(raw_input('How many credits is this course: '))
		totalCredits = totalCredits + credits
		grade = raw_input('What was the letter grade for the course (Include + or -): ')
		gradePoints = calculatePoints(grade)*credits
		totalPoints = totalPoints + gradePoints
		course = {'Course': name, 'Credits': credits, 'GradePoints': gradePoints}
		courses.append(course)
		status = raw_input('Would you like to enter another class? (y/n): ')
		if (status == 'n' or status == 'N'):
			cont = False

	gpa = totalPoints / totalCredits
	print ('Your gpa is a: ' + str(gpa))
	for course in courses:
		print(course)

def estimateGPA():
	cont = True
	courses = []
	
	totalPoints = 0
	currentGPA = raw_input('Enter current cumulative gpa: ')
	totalCredits = raw_input('Enter the number of credits taken to date: ')
	#Receive Input from the user, and add it to a list of dictionaries
	while(cont):
		name = raw_input('Enter the course name: ')
		credits = int(raw_input('How many credits is this course: '))
		totalCredits = totalCredits + credits
		grade = raw_input('What was the letter grade for the course (Include + or -): ')
		gradePoints = calculatePoints(grade)*credits
		totalPoints = totalPoints + gradePoints
		course = {'Course': name, 'Credits': credits, 'GradePoints': gradePoints}
		courses.append(course)
		status = raw_input('Would you like to enter another class? (y/n): ')
		if (status == 'n' or status == 'N'):
			cont = False

	gpa = totalPoints / totalCredits
	print ('Your gpa is a: ' + str(gpa))
	for course in courses:
		print(course)

def calculatePoints(grade):
	grade = grade.strip()

	if (grade in alpha):
		points = 4.0
	elif (grade in alphaMinus):
		points = 3.7
	elif (grade in betaPlus):
		points = 3.3
	elif (grade in beta):
		points = 3.0
	elif (grade in betaMinus):
		points = 2.7
	elif (grade in charliePlus):
		points = 2.3
	elif (grade in charlie):
		points = 2.0
	elif (grade in charlieMinus):
		points = 1.7
	elif (grade in deltaPlus):
		points = 1.3
	elif (grade in delta):
		points = 1.0
	elif (grade in deltaMinus):
		points = 0.7
	else:
		points = 0.0
	return points

if __name__ == '__main__':
   main()