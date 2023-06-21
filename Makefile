# Makefile variables
PROJECT_NAME := ProjectName
CXX := g++
CXXFLAGS := -Wall -Werror -std=c++20
LDFLAGS :=
SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin
INC_DIR := include
RES_DIR := res

# Automatic file collection
SRCS := $(wildcard $(SRC_DIR)/*.c) $(wildcard $(SRC_DIR)/*.cpp) $(wildcard $(SRC_DIR)/*.cc)
OBJS := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))
OBJS := $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(OBJS))
OBJS := $(patsubst $(SRC_DIR)/%.cc, $(OBJ_DIR)/%.o, $(OBJS))

# Executable path
EXECUTABLE := $(BIN_DIR)/$(PROJECT_NAME)


# Default target
all: $(EXECUTABLE) copy_resources

# Compile source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -I$(INC_DIR) -c $< -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -I$(INC_DIR) -c $< -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cc
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -I$(INC_DIR) -c $< -o $@

# Link object files into executable
$(EXECUTABLE): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CXX) $(LDFLAGS) $^ -o $@

# Copy resources to the bin directory
copy_resources:
	@mkdir -p $(BIN_DIR)
	cp -r $(RES_DIR) $(BIN_DIR)

# Clean the generated files
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

# Run the executable
run: $(EXECUTABLE)
	$(EXECUTABLE)

.PHONY: all copy_resources clean run
