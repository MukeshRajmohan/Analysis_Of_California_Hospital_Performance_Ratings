# Load the required libraries
library(ggplot2)
library(tidyr)
library(dplyr)
library(maps)

# Read the data from the CSV file
data <- read.csv("California_Clean.csv")

# Calculate the count of hospitals in each county
county_counts <- data %>%
    group_by(County) %>%
    summarise(Hospital_Count = n_distinct(Hospital))

# Count of hospitals in each county
ggplot(county_counts, aes(x = County, y = Hospital_Count)) +
    geom_bar(stat = "identity", fill = "orange",color='black') +
    labs(title = "Count of Hospitals by County", 
         x = "County", 
         y = "Count",
         caption = "Los Angeles County has the largest number of hospitals") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    theme(plot.caption = element_text(size=12, color="#404040", face="bold.italic",hjust=0.5)) +
    theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"))

# Calculate the count of hospitals for each performance measure
measure_counts <- data %>%
    group_by(Performance.Measure) %>%
    summarise(Hospital_Count = n_distinct(Hospital))

# Create the graph using ggplot2
ggplot(measure_counts, aes(x = Performance.Measure, y = Hospital_Count)) +
    geom_bar(stat = "identity", fill = "pink",color='white') +
    labs(title = "Count of Hospitals by Performance Measure", 
         x = "Performance Measure", 
         y = "Count",
         caption = "Elective Performance measure are present only few hospitals") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 6)) +
    theme(plot.caption = element_text(size=12, color="#404040", face="bold.italic",hjust=0.5)) +
    theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"))

# Calculate the number of adverse events in each county
county_counts <- data %>%
    group_by(County) %>%
    summarise(Adverse_Event_Count = sum(X..of.Adverse.Events))

# Create the graph using ggplot2
ggplot(county_counts, aes(x = County, y = Adverse_Event_Count)) +
    geom_bar(stat = "identity", fill = "orange",color='black') +
    labs(title = "Number of Adverse Events by County", 
         x = "County", 
         y = "Number of Adverse Events",
         caption = "Los Angeles County has the highest number of adverse events") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    theme(plot.caption = element_text(size=12, color="#404040", face="bold.italic",hjust=0.5)) +
    theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"))

# Get the county boundaries for California
ca_county_boundaries <- map_data("county", region = "california")

# Geographical distribution of hospitals
ggplot() +
    geom_polygon(data = ca_county_boundaries, aes(x = long, y = lat, group = group), 
                 fill = "#feedde", color = "black") +
    geom_path(data = ca_county_boundaries, aes(x = long, y = lat, group = group), 
              color = "black") +
    geom_point(data, mapping = aes(x = Longitude, y = Latitude), color = "red", size = 2) +
    labs(title = "Geographical distribution of hospitals", x = "", y = "") +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
          panel.grid = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank(),
          plot.margin = margin(10, 10, 10, 10))

# Stacked bar plot for the count of Adverse Events and Cases by Year
ggplot(data, aes(x = Year, fill = Performance.Measure)) +
    geom_bar(position = "stack") +
    labs(title = "Adverse Events and Cases by Year",
         x = "Year", y = "Count") +
    scale_fill_discrete(name = "Performance Measure")

# Scatter plot for Longitude and Latitude with color-coded Hospital Ratings
ggplot() +
    geom_polygon(data = ca_county_boundaries, aes(x = long, y = lat, group = group), 
                 fill = "#edf8fb", color = "black") +
    geom_point(data, mapping = aes(x = Longitude, y = Latitude, color = Hospital.Ratings)) +
    labs(title = "Geographical Distribution of Hospitals with Ratings",
         x = "", y = "") +
    scale_color_continuous(name = "Hospital Ratings") +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
          panel.grid = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank(),
          plot.margin = margin(10, 10, 10, 10))

# Scatter plot for Longitude and Latitude with color-coded County
ggplot() +
    geom_polygon(data = ca_county_boundaries, aes(x = long, y = lat, group = group), 
                 fill = "#edf8fb", color = "black") +
    geom_point(data,mapping = aes(x = Longitude, y = Latitude, color = County)) +
    labs(title = "Geographical Distribution of Hospitals by County",
         x = "", y = "") +
    scale_color_discrete(name = "County") +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
          panel.grid = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank(),
          plot.margin = margin(10, 10, 10, 10))

# Box plot for Risk-adjusted Rate by Type of Report:
ggplot(data, aes(x = Type.of.Report, y = Risk.adjusted.Rate)) +
    geom_boxplot() +
    labs(title = "Risk-adjusted Rate by Type of Report",
         x = "Type of Report", y = "Risk-adjusted Rate") +
    theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"))

# Bar plot for Hospital Ratings by System
ggplot(data, aes(x = system)) +
    geom_bar(fill = "#9e9ac8",color='black') +
    labs(title = "Hospital Ratings by System",
         x = "System", y = "Count",
         caption = "Independent System has the Highest Ratings") +
    scale_fill_discrete(name = "Hospital Ratings") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 6)) +
    theme(plot.caption = element_text(size=12, color="#404040", face="bold.italic",hjust=0.5)) +
    theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"))

# Research Questions

# Question 1
# Filter the data for the desired variables
filtered_data <- subset(data, select = c("Year", "Hospital", "Type.of.Report", "X..of.Cases"))

# Group the data by hospital and medical condition, and calculate the total number of cases
grouped_data <- aggregate(filtered_data$X..of.Cases, by = 
                              list(filtered_data$Hospital, filtered_data$Type.of.Report), FUN = sum)

# Rename the columns
colnames(grouped_data) <- c("Hospital", "Medical Condition", "Number of Cases")

# Filter the data to show the top 10 hospitals with the highest number of adverse cases
top_hospitals <- subset(grouped_data, Hospital %in% names(sort(table(grouped_data$Hospital), decreasing = TRUE))[1:20])

# Create the bar plot
ggplot(top_hospitals, aes(x = Hospital, y = `Number of Cases`, fill = `Medical Condition`)) +
    geom_bar(stat = "identity") +
    labs(title = "Top 10 Hospitals with Highest Number of Adverse Cases\nfor Specific Medical Conditions in California",
         x = "Hospital",
         y = "Number of Cases") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 6))

# Question 2
# Scatter plot showing hospital performance (e.g., risk-adjusted rate) by longitude and latitude:
ggplot() +
    geom_polygon(data = ca_county_boundaries, aes(x = long, y = lat, group = group), 
                 fill = "#bae4bc", color = "black") +
    geom_point(data, mapping = aes(x = Longitude, y = Latitude, color = Risk.adjusted.Rate)) +
    labs(title = "Hospital Performance by Geographical Location",
         x = "Longitude", y = "Latitude") +
    scale_color_continuous(name = "Risk-adjusted Rate", high = 'orange', low = 'firebrick2') +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
          panel.grid = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank(),
          plot.margin = margin(10, 10, 10, 10))

# Question 3
# Group the data by the time-related variable and calculate the average performance measure for each period
grouped_data <- data %>%
    group_by(Year) %>%
    summarize(Average_Performance = mean(Adverse.Event.Rate))

# Create the line plot
ggplot(grouped_data, aes(x = Year, y = Average_Performance)) +
    geom_line() +
    labs(title = "Hospital Performance Measure over Time",
         x = "Time Variable",
         y = "Average Performance Measure",
         caption = "Highest Performance in 2016 and Lowest Performance in 2019") +
    theme(plot.caption = element_text(size=12, color="#404040", face="bold.italic",hjust=0.5)) +
    theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"))
