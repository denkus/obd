create table med.logs (
    id bigserial not null constraint pk_logs primary key,
    text text,
    added timestamp default now()
);


create or replace function med.add_to_log_patients() returns trigger as
$$
declare
    log_text text;
begin
    if TG_OP in ('INSERT', 'UPDATE') then
        log_text := format('%s patient %s %s %s', TG_OP, NEW.last_name, NEW.first_name, NEW.middle_name);
        insert into med.logs (text) values (log_text);
        return NEW;
    elsif TG_OP = 'DELETE' then
        log_text := format('%s patient %s %s %s', TG_OP, OLD.last_name, OLD.first_name, OLD.middle_name);
        insert into med.logs (text) values (log_text);
        return OLD;
    end if;
end;
$$ language plpgsql;


create trigger logger_patients
    after insert or update or delete on med.patients for each row
    execute procedure med.add_to_log_patients();
