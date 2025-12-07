# Teaching Assistant Resources | Survey Data Privacy Course

Welcome to my Teaching Assistant repository for the Survey Data Privacy course! This collection contains homework assignments, detailed grading rubrics, complete solution files with commented R code, and datasets used throughout the course to help students understand data privacy concepts, statistical disclosure control methods, and privacy-preserving data analysis techniques.

## Repository Purpose

This repository serves as a centralized resource hub for the Survey Data Privacy course, providing students with structured assignments, comprehensive solutions, and supporting datasets needed to learn practical implementation of privacy protection methods in survey and statistical data contexts.

## Course Overview

The Survey Data Privacy course explores critical concepts in protecting confidential data while maintaining data utility for analysis. Students learn statistical disclosure control techniques, synthetic data generation, differential privacy concepts, and practical methods for balancing privacy protection with analytical validity in survey research contexts.

## Repository Contents

### Homework Assignments

Three comprehensive homework assignments with both student versions and grading rubrics:

**Homework Assignment 1**
* First_homework_assignment_2025.pdf: Student version of assignment
* First_homework_assignment_w_points.docx: Grading rubric with point allocations

This assignment introduces foundational data privacy concepts, focusing on disclosure risk assessment and basic statistical disclosure control methods.

**Homework Assignment 2**
* Second_homework_assignment_2025.pdf: Student version of assignment
* Second_homework_assignment_w_points.docx: Grading rubric with point allocations

The second homework explores advanced disclosure control techniques, including data masking methods, suppression strategies, and utility-privacy tradeoff analysis.

**Homework Assignment 3**
* Third_homework_assignment_2025.pdf: Student version of assignment
* Third_homework_assignment_w_points.docx: Grading rubric with point allocations

This assignment delves into synthetic data generation methods, evaluation of synthetic data quality, and assessment of disclosure risk in synthesized datasets.

### Solution Files

Complete R solution scripts with detailed comments explaining the approach, methodology, and interpretation:

* **Solution_HW1_Exercise1.R**: Comprehensive solution for Homework 1 Exercise 1, demonstrating data privacy assessment techniques and initial disclosure control methods

* **Solution_HW2.R**: Complete solutions for all Homework 2 exercises, covering advanced statistical disclosure control techniques, data masking implementations, and privacy-utility evaluation metrics

* **solution_HW3.R**: Detailed solutions for Homework 3, including synthetic data generation using multiple synthesis methods, quality assessment procedures, and disclosure risk evaluation frameworks

Each solution file includes:
* Thoroughly commented code explaining each step
* Implementation of privacy protection methods
* Evaluation of disclosure risk
* Assessment of data utility preservation
* Interpretation of results in privacy context

### Course Datasets

Four carefully selected datasets representing real-world survey data scenarios:

**lalonde.RData**
The Lalonde dataset from labor economics research, used to demonstrate privacy protection methods on observational study data with sensitive employment and earnings information.

**nhis.RData**
National Health Interview Survey (NHIS) data containing sensitive health information, perfect for exploring disclosure risks in health surveys and implementing appropriate protection methods.

**cps5000.RData**
Current Population Survey (CPS) sample data with 5,000 observations, providing realistic survey microdata for practicing statistical disclosure control techniques on demographic and economic variables.

**synthetic_cps.RData**
Synthesized version of CPS data generated using privacy-preserving synthesis methods, used to compare analytical validity between original and synthetic data while evaluating privacy protection effectiveness.

## Skills and Techniques Covered

Through these assignments and solutions, students develop expertise in:

**Data Privacy Fundamentals**
* Understanding disclosure risk types (identity, attribute, inferential)
* Assessing re-identification risks in microdata
* Balancing privacy protection with data utility
* Evaluating privacy-utility tradeoffs

**Statistical Disclosure Control Methods**
* Data suppression techniques
* Cell suppression in tabular data
* Generalization and recoding
* Top and bottom coding
* Microaggregation
* Data swapping and shuffling
* Noise addition methods

**Synthetic Data Generation**
* Multiple imputation for synthetic data
* Fully synthetic data creation
* Partially synthetic data approaches
* Synthesis model selection
* Quality assessment of synthetic data
* Preserving analytical validity in synthetic data

**Privacy Evaluation Metrics**
* Disclosure risk measurement
* Uniqueness detection
* Re-identification risk assessment
* Privacy risk scenarios analysis
* Utility preservation metrics
* Confidence interval overlap
* Point estimate comparison

**Advanced Privacy Concepts**
* Differential privacy foundations
* Epsilon parameter selection
* Privacy budget allocation
* Data anonymization techniques
* K-anonymity and l-diversity concepts

## Programming Implementation

All solutions are implemented in R, utilizing key privacy packages and methods:

**Core R Packages Used**
* **synthpop**: Synthetic data generation
* **sdcMicro**: Statistical disclosure control for microdata
* **simPop**: Synthetic population generation
* **MatchIt**: Propensity score matching (for Lalonde analysis)
* **tidyverse**: Data manipulation and visualization
* **car**: Regression diagnostics

**Analysis Techniques**
* Regression modeling on original and protected data
* Propensity score estimation
* Treatment effect estimation
* Model utility comparison
* Privacy risk calculation
* Synthetic data validation

## Teaching Approach

As a Teaching Assistant, I designed these materials to:

**Provide Clear Learning Pathways**
Progressive difficulty across three homework assignments, building from basic concepts to advanced synthesis methods.

**Emphasize Practical Implementation**
Real datasets from prominent surveys (NHIS, CPS, Lalonde) give students hands-on experience with actual data privacy challenges.

**Support Comprehensive Understanding**
Detailed solution files serve as learning resources, not just answer keys, with extensive comments explaining the reasoning behind each approach.

**Balance Theory and Practice**
Assignments connect statistical disclosure control theory with practical R implementations, helping students understand both the "why" and the "how."

## Grading Rubrics

Each assignment includes a detailed grading rubric (w_points.docx files) that clearly outlines:
* Point allocation for each question component
* Evaluation criteria for code quality
* Assessment standards for interpretation
* Expectations for privacy risk analysis
* Requirements for utility evaluation

These rubrics help ensure fair, consistent, and transparent grading while providing students with clear expectations for their work.

## File Organization

The repository follows a straightforward structure:
* **PDF files**: Student-facing homework assignments
* **DOCX files**: Instructor grading rubrics with point breakdowns
* **R files**: Complete solution scripts with detailed comments
* **RData files**: Datasets required for completing assignments

## Course Context

This course is part of survey methodology curriculum focusing on the critical intersection of data utility and privacy protection. In an era of increasing privacy regulations (GDPR, CCPA, HIPAA) and growing awareness of re-identification risks, these skills are essential for:

* Survey researchers handling confidential data
* Government statistical agencies releasing public-use microdata
* Data scientists working with sensitive information
* Privacy officers evaluating disclosure risks
* Researchers requiring IRB approval for data sharing

## Academic Integrity Note

This repository contains complete solution files intended as teaching resources and reference materials. Students enrolled in this course should attempt assignments independently before consulting solutions. The detailed comments in solution files are designed to enhance learning and understanding after students have engaged with the problems themselves.

## Learning Outcomes

By working through these materials, students will be able to:

* Identify and assess disclosure risks in survey microdata
* Implement appropriate statistical disclosure control methods
* Generate synthetic data that preserves analytical validity
* Evaluate privacy-utility tradeoffs quantitatively
* Choose appropriate protection methods for different data scenarios
* Interpret privacy risk measures correctly
* Communicate data privacy decisions to stakeholders
* Apply privacy-preserving techniques to real survey data

## TA Responsibilities

This repository reflects my teaching assistant work, which includes:

* Developing comprehensive assignment solutions
* Creating detailed grading rubrics
* Providing technical support to students
* Preparing datasets for coursework
* Ensuring reproducible code examples
* Documenting best practices in data privacy

All materials are designed to support effective learning while maintaining rigorous standards for data privacy education.
