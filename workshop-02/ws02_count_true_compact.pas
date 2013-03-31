(*****************************************************************************
 *
 *  @doc Подсчет  максимального количества подряд 
 *  стоящих элементов логического массива, имеющих значение `true`.
 *  Компактная версия.
 *  @author     Илья w-495 Никитин <w@w-495.ru> 
 *  @date       2013.03.31 21:16:39
 *  @version    1.3
 *
 *****************************************************************************)

program ws02_count_true_compact;

const MAXSIZE           = 1024;
const FILLARRAY_FACTOR  = 17;

type size_t     = word;
type contents_t = boolean;

type boolean_array_t = array[1..MAXSIZE] of contents_t;

function fillarray(msize :size_t): boolean_array_t;
    var counter         :size_t;
    var value           :contents_t;
    var boolean_array   :boolean_array_t;
    begin
        for counter := 1 to MAXSIZE do begin
            value := (0 = (counter mod FILLARRAY_FACTOR));
            boolean_array[counter] := not value;
        end;
        fillarray := boolean_array
    end;

procedure main(fiction: boolean);
    var counter         :size_t;
    var ntrues          :size_t;
    var ntrues_max      :size_t;
    var boolean_array   :boolean_array_t;
    begin
        ntrues      := 0;
        ntrues_max  := 0;

        boolean_array := fillarray(MAXSIZE);
        
        for counter:= 1 to MAXSIZE do begin
            if(true = boolean_array[counter]) then
            begin
                ntrues := ntrues + 1;
                if ntrues > ntrues_max then
                    ntrues_max := ntrues;
            end
            else
                ntrues := 0;
        end;
 
        writeln(ntrues_max);
    end;

begin
    main(true);
end.



