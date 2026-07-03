#=========================================
# WEEK 8 PRACTICAL
#=========================================

# Load package
library(dplyr)

#=========================================
# 1. Show the details of students whose
#    final_exam_mark is greater than 80%.
#=========================================

student_data[student_data$final_exam_mark > 80, ]

#=========================================
# 2. Arrange the dataset in ascending
#    order based on course_work_mark.
#=========================================

student_data[order(student_data$coursework_mark), ]
#=========================================
# 3. Display only the student_name and
#    final_exam_mark attributes.
#=========================================

student_data[, c("student_name", "final_exam_mark")]

#=========================================
# 4. Specify the number of rows and
#    columns in the dataset.
#=========================================

nrow(student_data)
ncol(student_data)


#=========================================
# 5. Obtain the details of the dataset.
#=========================================
str(student_data)
summary(student_data)
head(student_data)
names(student_data)

#=========================================
# 6. Identify and detect outliers using R.
#=========================================

# Create a boxplot
boxplot(student_data$final_exam_mark,
        main = "Final Exam Mark Boxplot",
        ylab = "Final Exam Mark")

# Calculate Quartiles
Q1 <- quantile(student_data$final_exam_mark, 0.25)
Q3 <- quantile(student_data$final_exam_mark, 0.75)

# Calculate IQR
IQR <- Q3 - Q1

# Calculate Lower and Upper Fences
le <- Q1 - 1.5 * IQR
ue <- Q3 + 1.5 * IQR

# Display the fences
le
ue

# Show the outlier values
student_data$final_exam_mark[
  student_data$final_exam_mark < le |
    student_data$final_exam_mark > ue
]

# Show the rows containing outliers
student_data[
  student_data$final_exam_mark < le |
    student_data$final_exam_mark > ue,
]

# Remove the outliers
student_data_new <- student_data[
  student_data$final_exam_mark >= le &
    student_data$final_exam_mark <= ue,
]

# Boxplot after removing outliers
boxplot(student_data_new$final_exam_mark,
        main = "Handling Outlier Boxplot",
        ylab = "Final Exam Mark")