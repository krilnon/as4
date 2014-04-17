open Printf

let () =
    let argNum = Array.length Sys.argv in
    if argNum = 2 then begin (* only accepts 1 arg, the filename to compile *)
        let file = Sys.argv.(1) in
        printf "input file is %s\n" file;
        let reader = open_in file in
        try
            let line = input_line reader in
            print_endline line;
            flush stdout;
            close_in reader

        with e ->
            close_in_noerr reader;
            raise e
    end else print_endline "usage: as4c [filename]"
