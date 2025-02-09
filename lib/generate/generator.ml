(** Module to generate numbers *)
module Generator = struct
  (* tail recursive get len function *)
  let lst_len_tail (lst: int list): int =
    let rec lst_len_tail' (lst: 'a list) (result: int): int =
      match lst with
      | [] -> result
      | _ :: tail -> lst_len_tail' tail (result + 1)
    in lst_len_tail' lst 0

  (* ----------------------------------------------------------- *)

  let rand_select (lst: int list) (n: int): int list =
    let rec extract_rnd acc n = function
      | [] -> raise Not_found
      | head :: tail ->
        if n = 0 then (head, acc @ tail) (* Extracts an elem when n = 0, appending tail at the end of acc *)
        else extract_rnd (head :: acc) (n - 1) tail (* Continues with tail, prepending head to the acc *)
    in

    let rec rand' n len acc = function
      | [] -> acc
      | lst ->
        if n = 0 then acc else
          let num = Random.int len in
          let elem, tail = extract_rnd [] num lst in

          rand' (n - 1) (len - 1) (elem :: acc) tail
    in

    Random.self_init();
    let len = (lst_len_tail lst) in

    rand' n len [] lst

  (* ------------------------------------------------------------ *)

  let range (srt: int) (nd: int) =
    let rec range' (acc: int list) srt nd =
      if srt < nd then acc else range' (srt :: acc) (srt - 1) nd
    in

    range' [] nd srt

  let rec printer (lst: int list): unit =
    match lst with
    | hd :: tail ->
      Printf.printf "%u, " hd;
      printer tail
    | [] -> Printf.printf "\b\b"

  (* --------------------------------------- *)
  let generate(number: int): unit =
    let final: int list = rand_select (range 1 25) number in

    printer final
end
