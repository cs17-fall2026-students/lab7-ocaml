(* HELPERS (do not call) *)

(* take in a string, s, and print it with green color *)
let print_green (s : string) : unit = Printf.printf "\027[32m%s\027[0m\n" s

(* take in a string, s, and print it with red color *)
let print_red (s : string) : unit = Printf.printf "\027[31m%s\027[0m\n" s

(* report
 * Input: a tuple of message, a string, ok, a bool, and actual and expected,
 *        two strings
 * Output: nothing (but prints the test output in the terminal) *)
let report ((message, ok, actual, expected) : string * bool * string * string) :
    unit =
  if ok then print_green ("ceSuccess: " ^ message)
  else begin
    print_red ("ceFail: " ^ message);
    print_red "expected output: ";
    print_endline expected;
    print_red "actual output: ";
    print_endline actual
  end

let show_sexp (sexp_of, value) = Sexplib0.Sexp.to_string_hum (sexp_of value)

let check_expect (sexp_of, actual, expected, message) =
  report
    ( message,
      expected = actual,
      show_sexp (sexp_of, actual),
      show_sexp (sexp_of, expected) )

let sexp_of_int = Sexplib0.Sexp_conv.sexp_of_int
let sexp_of_float = Sexplib0.Sexp_conv.sexp_of_float
let sexp_of_bool = Sexplib0.Sexp_conv.sexp_of_bool
let sexp_of_string = Sexplib0.Sexp_conv.sexp_of_string
let sexp_of_list = Sexplib0.Sexp_conv.sexp_of_list
let sexp_of_option = Sexplib0.Sexp_conv.sexp_of_option
let sexp_of_char = Sexplib0.Sexp_conv.sexp_of_char
let sexp_of_unit = Sexplib0.Sexp_conv.sexp_of_unit
let sexp_of_int_list = Sexplib0.Sexp_conv.sexp_of_list sexp_of_int
let sexp_of_float_list = Sexplib0.Sexp_conv.sexp_of_list sexp_of_float
let sexp_of_bool_list = Sexplib0.Sexp_conv.sexp_of_list sexp_of_bool
let sexp_of_string_list = Sexplib0.Sexp_conv.sexp_of_list sexp_of_string

let sexp_of_string_pair =
  Sexplib0.Sexp_conv.sexp_of_pair sexp_of_string sexp_of_string

let sexp_of_string_pair_list =
  Sexplib0.Sexp_conv.sexp_of_list sexp_of_string_pair

let sexp_of_int_list_list = Sexplib0.Sexp_conv.sexp_of_list sexp_of_int_list
let sexp_of_float_list_list = Sexplib0.Sexp_conv.sexp_of_list sexp_of_float_list
let sexp_of_bool_list_list = Sexplib0.Sexp_conv.sexp_of_list sexp_of_bool_list

let sexp_of_string_list_list =
  Sexplib0.Sexp_conv.sexp_of_list sexp_of_string_list

let sexp_of_int_option = Sexplib0.Sexp_conv.sexp_of_option sexp_of_int
let sexp_of_float_option = Sexplib0.Sexp_conv.sexp_of_option sexp_of_float
let sexp_of_bool_option = Sexplib0.Sexp_conv.sexp_of_option sexp_of_bool
let sexp_of_string_option = Sexplib0.Sexp_conv.sexp_of_option sexp_of_string

(* FOR STUDENT USE: check-expects for each type
 * Usage: check_expect_int (actual, expected, "message") *)

let check_expect_int (actual, expected, message) =
  check_expect (sexp_of_int, actual, expected, message)

(* passes if actual is within 0.01 of expected *)
let check_expect_float (actual, expected, message) =
  report
    ( message,
      Float.abs (actual -. expected) <= 0.01,
      show_sexp (sexp_of_float, actual),
      show_sexp (sexp_of_float, expected) )

let check_expect_bool (actual, expected, message) =
  check_expect (sexp_of_bool, actual, expected, message)

let check_expect_string (actual, expected, message) =
  check_expect (sexp_of_string, actual, expected, message)

let check_expect_int_list (actual, expected, message) =
  check_expect (sexp_of_int_list, actual, expected, message)

let check_expect_float_list (actual, expected, message) =
  check_expect (sexp_of_float_list, actual, expected, message)

let check_expect_bool_list (actual, expected, message) =
  check_expect (sexp_of_bool_list, actual, expected, message)

let check_expect_string_list (actual, expected, message) =
  check_expect (sexp_of_string_list, actual, expected, message)

let check_expect_int_list_list (actual, expected, message) =
  check_expect (sexp_of_int_list_list, actual, expected, message)

let check_expect_float_list_list (actual, expected, message) =
  check_expect (sexp_of_float_list_list, actual, expected, message)

let check_expect_bool_list_list (actual, expected, message) =
  check_expect (sexp_of_bool_list_list, actual, expected, message)

let check_expect_string_list_list (actual, expected, message) =
  check_expect (sexp_of_string_list_list, actual, expected, message)

let check_expect_string_pair_list (actual, expected, message) =
  check_expect (sexp_of_string_pair_list, actual, expected, message)

let check_expect_int_option (actual, expected, message) =
  check_expect (sexp_of_int_option, actual, expected, message)

let check_expect_float_option (actual, expected, message) =
  check_expect (sexp_of_float_option, actual, expected, message)

let check_expect_bool_option (actual, expected, message) =
  check_expect (sexp_of_bool_option, actual, expected, message)

let check_expect_string_option (actual, expected, message) =
  check_expect (sexp_of_string_option, actual, expected, message)
