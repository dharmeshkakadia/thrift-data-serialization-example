namespace java org.example // defines the package name for the generated code
namespace py org.example

typedef i32 int // We can use typedef to get pretty names for the types we are using

enum EventName {
  GREAT,
  GOOD,
  BAD
}  

enum State {
  RECIEVED = 0, // Enum's can have integers assigned to them and works like Enum in any language
  PROCESSED = 1,
  DELETED = 2
}

struct Event {
  11: required EventName eventName; // required will throw exception if not provided.
  12: required int version;
  13: optional State state;
}
