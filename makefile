TARGET_EXEC ?= a.out

BUILD_DIR ?= build
SRC_DIRS ?= src

SRCS := $(shell find $(SRC_DIRS) -name *.cpp)
OBJS := $(SRCS:$(SRC_DIRS)/%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

INC_PATH := $(wildcard $(SRC_DIRS)/*)
INC_FLAGS := $(addprefix -I,$(INC_PATH))

CPPFLAGS ?= $(INC_FLAGS) -MMD -MP -std=c++17

all: $(TARGET_EXEC)

$(TARGET_EXEC): $(OBJS)
	$(CXX) $(OBJS) -o $@ $(LDFLAGS)

# c++ source
$(BUILD_DIR)/%.cpp.o: $(SRC_DIRS)/%.cpp
	$(MKDIR_P) $(dir $@)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

.PHONY: all clean

clean:
	$(RM) -r $(BUILD_DIR)
	$(RM) $(TARGET_EXEC)

-include $(DEPS)

MKDIR_P ?= mkdir -p