CREATE OR REPLACE FUNCTION atualiza_hangar()
RETURNS TRIGGER 
AS
$$	
	BEGIN
		
		UPDATE Aeronave SET aeroporto_cod_iata = NEW.aeroporto_cod_chegada WHERE cod_aeronave = NEW.aeronave_cod_aeronave;
		
		RETURN OLD;
	END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER tg_atualiza_hangar
AFTER INSERT ON Voo FOR EACH ROW
EXECUTE FUNCTION atualiza_hangar();

SELECT 50 * EXTRACT(epoch from duracao_voo)/3600 FROM Voo WHERE cod_voo = 8;

SELECT INTO duracao duracao_voo from Voo WHERE cod_voo IN (SELECT voo_cod_voo FROM Tripulação_voo WHERE tripulação_funcionário_id_func = reg.tripulação_funcionário_id_func);

