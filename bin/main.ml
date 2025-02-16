module Gen = Generator.Generator

let check_args (): string list =
  let argv: string list = Array.to_list Sys.argv in

  if List.length argv < 2 then
    (
    print_endline "Please provide one or more arguments...";
    exit 1
    )
  else
    argv


(* Entrypoint *)
let () =
  let argv: string list = check_args () in

  let exec_commands = function
    | [_ ; numbers] when int_of_string numbers <= 20 && int_of_string numbers >= 15 ->
      Gen.generate (int_of_string numbers)

    | [_ ; numbers] when int_of_string numbers > 20 ->
      Printf.printf "%s is way too high. Please select a range of 15 - 20" numbers
        
    | [_ ; numbers] when int_of_string numbers < 15 ->
      Printf.printf "%s is way too low. Please select a range of 15 - 20" numbers

    | lst when (List.length lst > 2) ->
      print_endline (
        "Too many arguments. Usage: " ^
        "\n > lotofacil <how_many_numbers>"
      )

    | _ -> print_endline (
        "Invalid_argument. Usage: " ^
        "\n > lotofacil <how_many_numbers>"
      )
  in

  exec_commands argv
