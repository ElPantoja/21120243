eliza :-
    writeln('Hola, soy tu asistente medico personal.'),
    readln(Input),
    eliza(Input),!.

eliza(['adios']) :-
    writeln('Adios, espero haberte ayudado cuidate'), !.

eliza(['Adios']) :-
    writeln('Adios, espero haberte ayudado, cuidate'), !.

eliza(Input) :-
    template(Stim, Resp, IndStim),
    match(Stim, Input), %ve_si_coincide_stim_e_input
    replace0(IndStim, Input, 0, Resp, R),
    writeln(R),
    readln(Input1),
    eliza(Input1), !.

%TEMPLATES_CON_RESPUESTAS
template([hola, __], ['Hola, en que puedo ayudarte?'], []).
template([gracias, __], ['De nada, es un placer ayudarte'], []).
template([dime, como, me, puedes, ayudar, __], ['Te puedo ayudar a detectar sintomas de enfermedades, decirte a que medico puedes acudir'], []).
template([en, que, me, puedes, ayudar, __], ['Te puedo ayudar a detectar sintomas de enfermedades, decirte a que medico puedes acudir'], []).
template([que, es, lo, que, haces, __], ['Detecto sintomas de enfermedades'], []).
template([eres, doctor, __], ['No, soy un asistente que te ayuda a detectar enfermedades para que vayas al doctor y no te hagan menso, ya que los doctores son muy mañosos'], []).
template([como, me, puedes, ayudar, __], ['Si te sientes mal y tienes sintomas de alguna enfermedad, yo lo unico que hago es orientarte para que asi tengas una idea de la enfermedad que tienes'], []).
template([me, puedes, ayudar, a, saber, que, enfermedad, tengo, __], ['Claro que si, tu nomas dime que sintomas tienes, para asi saber que enfermedad podrias tener'], []).
template([como, te, llamas, __], ['Me llamo Chatgepete y estoy aqui para ayudarte'], []).
template([hola, como, estas, __], ['Siempre estoy bien, estoy programado para andar siempre al 100 y no enfermo como tu...'], []).
template([me, siento, mal, __], ['¿Estas enfermo, tienes algun sintoma en especifico, algun dolor?'], []).
template([estoy, enfermo, __], ['Te puedo ayudar a decirte que enfermedad tienes dependiendo de tus sintomas y recomendarte algun medico'], []).
template([dame, los, tios, de, manuel, _], ['Los tios de manuel son: angelica,leticia,rafael,dagoberto,lila,cuco,lucia,josefina,maria'], []).


%TEMPLATES_CON_FLAGS
template([que, enfermedad, puedo, tener, si, tengo, dolor, de, s()], [flag], [8]).
template([que, enfermedad, puedo, tener, si, tengo, s()], [flag], [6]).
template([tambien, tengo, dolor, de, s(_)], [flag], [4]).
template([tambien, tengo, dolor, s(_)], [flag], [3]).
template([tengo, s(_)], [flag], [1]).
template([tengo, vision, s(_)], [flag], [2]).
template([me, duele, mi, s(_), que, es, lo, que, tengo, _], [flag], [3]).
template([tengo, perdida, de, s(_), que, es, lo, que, tengo, _], [flag], [3]).
template([tengo, dificultad, para, _, _], [flag], [3]).
template([recomiendame, un, doctor, si, tengo, _, _], [flag2], [5]).
template([me, puedes, recomendar, un, doctor, si, tengo, s(_)], [flag2], [7]).
template([que, doctor, me, recomiendas, si, tengo, s(_)], [flag2], [6]).
template([recomiendame, un, tratamiento, si, tengo, _, _], [flag3], [5]).
template([me, puedes, recomendar, un, tratamiento, si, tengo, s(_)], [flag3], [7]).
template([que, tratamiento, me, recomiendas, si, tengo, s(_)], [flag3], [6]).
template([quien, es, s(_), _], [flag4], [2]).

match([], []).
match([], _):- true.

match([S|Stim], [I|Input]) :-
    atom(S),
    S == I,
    match(Stim, Input), !.

match([S|Stim], [_|Input]) :-
    \+ atom(S),
    match(Stim, Input), !.


replace0([], _, _, Resp, R) :- append(Resp, [], R), !.

replace0([I|Index], Input, N, Resp, R) :-
    nth0(I, Input, Atom),
    select(N, Resp, Atom, R1),
    replace0(Index, Input, N, R1, R), !.

%SINTOMAS
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flag,
    sintoma(Atom, R).

%MEDICOS
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flag2,
    medico(Atom, R).

%TRATAMIENTOS
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flag3,
    tratamiento(Atom, R).

%FAMILIARES
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flag4,
    familiar(Atom, R).

%REGLAS_PARA_LOS_SINTOMAS
sintoma(X, R) :-
    sintomas(X),
    (
        %Alzheimer
        X = dificultad_para_recordar_eventos_recientes, R = ['Dificultad para recordar eventos recientes puede ser causada por la enfermedad de Alzheimer'];
        X = perdida_de_memoria_a_corto_plazo, R = ['Perdida de memoria a corto plazo puede ser causada por la enfermedad de Alzheimer'];
        X = confusion_con_el_tiempo_o_el_lugar, R = ['Confusión con el tiempo o el lugar puede ser causada por la enfermedad de Alzheimer'];
        X = problemas_para_comprender_imagenes_visuales_y_relaciones_espaciales, R = ['Problemas para comprender imágenes visuales y relaciones espaciales pueden ser causados por la enfermedad de Alzheimer'];
        X = dificultad_para_encontrar_las_palabras_adecuadas_al_hablar, R = ['Dificultad para encontrar las palabras adecuadas al hablar puede ser causada por la enfermedad de Alzheimer'];
        X = colocacion_de_objetos_en_lugares_equivocados_y_perdida_de_la_capacidad_de_recordar_pasos, R = ['Colocación de objetos en lugares equivocados y pérdida de la capacidad de recordar pasos puede ser causada por la enfermedad de Alzheimer'];
        X = disminucion_o_falta_de_juicio, R = ['Disminución o falta de juicio puede ser causada por la enfermedad de Alzheimer'];
        X = retiro_de_las_actividades_sociales_o_laborales, R = ['Retiro de las actividades sociales o laborales puede ser causado por la enfermedad de Alzheimer'];
        X = cambios_en_el_humor_y_la_personalidad, R = ['Cambios en el humor y la personalidad pueden ser causados por la enfermedad de Alzheimer'];
        X = problemas_para_realizar_tareas_cotidianas_en_el_hogar_el_trabajo_o_en_su_tiempo_libre, R = ['Problemas para realizar tareas cotidianas en el hogar, el trabajo o en su tiempo libre pueden ser causados por la enfermedad de Alzheimer'];
        X = perdida_de_iniciativa_en_tareas_cotidianas, R = ['Pérdida de iniciativa en tareas cotidianas puede ser causada por la enfermedad de Alzheimer'];
        X = dificultad_para_recordar_nombres_de_familiares_y_amigos, R = ['Dificultad para recordar nombres de familiares y amigos puede ser causada por la enfermedad de Alzheimer'];
        X = dificultad_para_seguir_conversaciones_o_encontrar_palabras_adecuadas, R = ['Dificultad para seguir conversaciones o encontrar palabras adecuadas puede ser causada por la enfermedad de Alzheimer'];
        X = problemas_para_reconocer_caras_conocidas, R = ['Problemas para reconocer caras conocidas pueden ser causados por la enfermedad de Alzheimer'];
        X = dificultad_para_realizar_calculos_sencillos_o_recordar_fechas_importantes, R = ['Dificultad para realizar cálculos sencillos o recordar fechas importantes puede ser causada por la enfermedad de Alzheimer'];
        X = olvidar_eventos_importantes_o_preguntar_la_misma_informacion_repetidamente, R = ['Olvidar eventos importantes o preguntar la misma información repetidamente puede ser causado por la enfermedad de Alzheimer'];
        X = necesidad_de_asistencia_para_elegir_la_ropa_adecuada_segun_la_temporada, R = ['Necesidad de asistencia para elegir la ropa adecuada según la temporada puede ser causada por la enfermedad de Alzheimer'];
        X = perdida_de_interes_en_pasatiempos_o_actividades_favoritas, R = ['Pérdida de interés en pasatiempos o actividades favoritas puede ser causada por la enfermedad de Alzheimer'];
        X = comportamientos_repetitivos_como_repetir_las_mismas_preguntas_o_actividades, R = ['Comportamientos repetitivos, como repetir las mismas preguntas o actividades pueden ser causados por la enfermedad de Alzheimer'];
        X = dificultad_para_adaptarse_a_cambios_en_la_rutina, R = ['Dificultad para adaptarse a cambios en la rutina puede ser causada por la enfermedad de Alzheimer'];
        %Oseo
        X = dolor_en_las_articulaciones, R = ['Dolor en las articulaciones puede ser causado por enfermedades óseas'];
        X = rigidez_articular, R = ['Rigidez articular puede ser causada por enfermedades óseas'];
        X = inflamacion_en_las_articulaciones, R = ['Inflamación en las articulaciones puede ser causada por enfermedades óseas'];
        X = dificultad_para_moverse, R = ['Dificultad para moverse puede ser causada por enfermedades óseas'];
        X = fatiga_o_debilidad_muscular, R = ['Fatiga o debilidad muscular puede ser causada por enfermedades óseas'];
        X = deformidades_oseas, R = ['Deformidades óseas pueden ser causadas por enfermedades óseas'];
        X = dolor_oseo, R = ['Dolor óseo puede ser causado por enfermedades óseas'];
        X = fracturas_oseas_frecuentes, R = ['Fracturas óseas frecuentes pueden ser causadas por enfermedades óseas'];
        X = perdida_de_altura_debido_a_fracturas_vertebrales, R = ['Pérdida de altura debido a fracturas vertebrales puede ser causada por enfermedades óseas'];
        X = curvatura_anormal_de_la_columna_vertebral, R = ['Curvatura anormal de la columna vertebral puede ser causada por enfermedades óseas'];
        X = rango_de_movimiento_limitado_en_las_articulaciones, R = ['Rango de movimiento limitado en las articulaciones puede ser causado por enfermedades óseas'];
        X = crepitacion_o_crujidos_en_las_articulaciones, R = ['Crepitación o crujidos en las articulaciones pueden ser causados por enfermedades óseas'];
        X = hinchazon_en_las_articulaciones, R = ['Hinchazón en las articulaciones puede ser causada por enfermedades óseas'];
        X = perdida_de_masa_osea_o_densidad_osea, R = ['Pérdida de masa ósea o densidad ósea puede ser causada por enfermedades óseas'];
        X = dolor_de_espalda_cronico, R = ['Dolor de espalda crónico puede ser causado por enfermedades óseas'];
        X = entumecimiento_u_hormigueo_en_las_extremidades, R = ['Entumecimiento u hormigueo en las extremidades puede ser causado por enfermedades óseas'];
        X = rigidez_matutina, R = ['Rigidez matutina puede ser causada por enfermedades óseas'];
        X = dolor_al_levantar_objetos_pesados, R = ['Dolor al levantar objetos pesados puede ser causado por enfermedades óseas'];
        X = dolor_persistente_en_reposo, R = ['Dolor persistente en reposo puede ser causado por enfermedades óseas'];
        X = dificultad_para_caminar_o_moverse, R = ['Dificultad para caminar o moverse puede ser causada por enfermedades óseas'];
        %Dengue
        X = fiebre_repentina_y_alta, R = ['Fiebre repentina y alta puede ser causada por el dengue'];
        X = dolor_de_cabeza_intenso_especialmente_detras_de_los_ojos, R = ['Dolor de cabeza intenso, especialmente detrás de los ojos puede ser causado por el dengue'];
        X = nauseas_y_vomitos, R = ['Náuseas y vómitos pueden ser causados por el dengue'];
        X = erupcion_cutanea_generalmente_en_el_tronco_y_luego_se_extiende_a_los_brazos_las_piernas_y_la_cara, R = ['Erupción cutánea puede ser causada por el dengue'];
        X = fatiga_extrema_y_debilidad, R = ['Fatiga extrema y debilidad pueden ser causadas por el dengue'];
        X = sangrado_de_encias_o_nariz, R = ['Sangrado de encías o nariz puede ser causado por el dengue'];
        X = dolor_abdominal_intenso, R = ['Dolor abdominal intenso puede ser causado por el dengue'];
        X = disminucion_del_apetito, R = ['Disminución del apetito puede ser causada por el dengue'];
        X = sensibilidad_a_la_luz, R = ['Sensibilidad a la luz puede ser causada por el dengue'];
        X = ganglios_linfaticos_inflamados_y_dolorosos, R = ['Ganglios linfáticos inflamados y dolorosos pueden ser causados por el dengue'];
        X = sensacion_de_opresion_en_el_pecho, R = ['Sensación de opresión en el pecho puede ser causada por el dengue'];
        X = dificultad_para_respirar, R = ['Dificultad para respirar puede ser causada por el dengue'];
        X = hemorragias_internas, R = ['Hemorragias internas pueden ser causadas por el dengue'];
        X = dolor_detras_de_los_ojos_al_moverlos, R = ['Dolor detrás de los ojos al moverlos puede ser causado por el dengue'];
        X = inflamacion_abdominal, R = ['Inflamación abdominal puede ser causada por el dengue'];
        X = descenso_repentino_de_la_temperatura_corporal, R = ['Descenso repentino de la temperatura corporal puede ser causado por el dengue'];
        X = cambios_en_la_presion_arterial, R = ['Cambios en la presión arterial pueden ser causados por el dengue'];
        X = convulsiones, R = ['Convulsiones pueden ser causadas por el dengue'];
        X = perdida_del_conocimiento, R = ['Pérdida del conocimiento puede ser causada por el dengue'];
        X = acumulacion_de_liquido_en_los_pulmones, R = ['Acumulación de líquido en los pulmones puede ser causada por el dengue'];
        


        R = ['puede que', X, 'sea un sintoma, solo que no se cual enfermedad es']
    ).

sintoma(X, R) :- \+ sintomas(X), R = ['no se sabe si', X, 'sea un sintoma de alguna enfermedad'].

%BASE_DE_SINTOMAS

%Alzheimer
sintomas(dificultad_para_recordar_eventos_recientes).
sintomas(perdida_de_memoria_a_corto_plazo).
sintomas(confusion_con_el_tiempo_o_el_lugar).
sintomas(problemas_para_comprender_imagenes_visuales_y_relaciones_espaciales).
sintomas(dificultad_para_encontrar_las_palabras_adecuadas_al_hablar).
sintomas(colocacion_de_objetos_en_lugares_equivocados_y_perdida_de_la_capacidad_de_recordar_pasos).
sintomas(disminucion_o_falta_de_juicio).
sintomas(retiro_de_las_actividades_sociales_o_laborales).
sintomas(cambios_en_el_humor_y_la_personalidad).
sintomas(problemas_para_realizar_tareas_cotidianas_en_el_hogar_el_trabajo_o_en_su_tiempo_libre).
sintomas(perdida_de_iniciativa_en_tareas_cotidianas).
sintomas(dificultad_para_recordar_nombres_de_familiares_y_amigos).
sintomas(dificultad_para_seguir_conversaciones_o_encontrar_palabras_adecuadas).
sintomas(problemas_para_reconocer_caras_conocidas).
sintomas(dificultad_para_realizar_calculos_sencillos_o_recordar_fechas_importantes).
sintomas(olvidar_eventos_importantes_o_preguntar_la_misma_informacion_repetidamente).
sintomas(necesidad_de_asistencia_para_elegir_la_ropa_adecuada_segun_la_temporada).
sintomas(perdida_de_interes_en_pasatiempos_o_actividades_favoritas).
sintomas(comportamientos_repetitivos_como_repetir_las_mismas_preguntas_o_actividades).
sintomas(dificultad_para_adaptarse_a_cambios_en_la_rutina).
%Oseo
sintomas(dolor_en_las_articulaciones).
sintomas(rigidez_articular).
sintomas(inflamacion_en_las_articulaciones).
sintomas(dificultad_para_moverse).
sintomas(fatiga_o_debilidad_muscular).
sintomas(deformidades_oseas).
sintomas(dolor_oseo).
sintomas(fracturas_oseas_frecuentes).
sintomas(perdida_de_altura_debido_a_fracturas_vertebrales).
sintomas(curvatura_anormal_de_la_columna_vertebral).
sintomas(rango_de_movimiento_limitado_en_las_articulaciones).
sintomas(crepitacion_o_crujidos_en_las_articulaciones).
sintomas(hinchazon_en_las_articulaciones).
sintomas(perdida_de_masa_osea_o_densidad_osea).
sintomas(dolor_de_espalda_cronico).
sintomas(entumecimiento_u_hormigueo_en_las_extremidades).
sintomas(rigidez_matutina).
sintomas(dolor_al_levantar_objetos_pesados).
sintomas(dolor_persistente_en_reposo).
sintomas(dificultad_para_caminar_o_moverse).
%Dengue
sintomas(fiebre_repentina_y_alta).
sintomas(dolor_de_cabeza_intenso_especialmente_detras_de_los_ojos).
sintomas(nauseas_y_vomitos).
sintomas(erupcion_cutanea_generalmente_en_el_tronco_y_luego_se_extiende_a_los_brazos_las_piernas_y_la_cara).
sintomas(fatiga_extrema_y_debilidad).
sintomas(sangrado_de_encias_o_nariz).
sintomas(dolor_abdominal_intenso).
sintomas(disminucion_del_apetito).
sintomas(sensibilidad_a_la_luz).
sintomas(ganglios_linfaticos_inflamados_y_dolorosos).
sintomas(sensacion_de_opresion_en_el_pecho).
sintomas(dificultad_para_respirar).
sintomas(hemorragias_internas).
sintomas(dolor_detras_de_los_ojos_al_moverlos).
sintomas(inflamacion_abdominal).
sintomas(descenso_repentino_de_la_temperatura_corporal).
sintomas(cambios_en_la_presion_arterial).
sintomas(convulsiones).
sintomas(perdida_del_conocimiento).
sintomas(acumulacion_de_liquido_en_los_pulmones).




%DEFINIMOS_MEDICOS
medico(X, R) :-
    medicos(X),
    (
        X = alzheimer, R = ['Te Recomiendo un Neurologo: Los neurologos son especialistas en enfermedades
del cerebro y del sistema nervioso, incluyendo el Alzheimer.'];
        X = oseo, R = ['Te Recomiendo un Endocrinologo: Se especializan en trastornos hormonales y metabólicos, incluyendo enfermedades oseas como la enfermedad de Paget.'];
        X = dengue, R = ['Te Recomiendo un Infectologo: Especialistas en enfermedades infecciosas que tienen un conocimiento profundo sobre el diagnóstico y tratamiento del dengue.'];

        R = ['Puede ser que', X, 'sea una enfermedad solo que no sé qué medico recomendarte']
    ).

medico(X, R) :- \+ medicos(X), R = ['no se si', X, 'sea una enfermedad, lo siento'].

%BASE_DE_MEDICOS
medicos(alzheimer).
medicos(oseo).
medicos(dengue).

%DEFINIMOS_TRATAMIENTOS
tratamiento(X, R) :-
    tratamientos(X),
    (
        X = alzheimer, R = ['te recomendaria para el Alzheimer:

    1.- Inhibidores de la colinesterasa:
      1.1 Donepezil (Aricept)
      1.2 Rivastigmina (Exelon)
      1.3 Galantamina (Razadyne)
      Estos medicamentos funcionan aumentando los niveles de neurotransmisores en el cerebro.

    2.- Memantina (Namenda):
      Utilizada para el tratamiento de la enfermedad de Alzheimer moderada a grave, 
      actua regulando la actividad del glutamato, otro neurotransmisor importante.

    3.- Estimulacion cognitiva:
      Programas disenados para mejorar la memoria y otras funciones cognitivas a traves 
      de ejercicios y actividades mentales.

    4.- Control de factores de riesgo cardiovascular:
      Manejo de la hipertension, diabetes y colesterol alto, que pueden afectar negativamente
      la salud cerebral.'];

        X = oseo, R = ['Para el tratamiento de Oseo, te recomendaria:
        1.- Bifosfonatos:

                1.1 Alendronato (Fosamax): Ayuda a reducir la actividad de los osteoclastos, las células que descomponen el hueso, lo que disminuye la remodelación osea anormal.
                1.2 Risedronato (Actonel): Similar al alendronato, reduce la actividad de los osteoclastos.
                1.3 Pamidronato (Aredia): Administrado por via intravenosa, se usa en casos mas severos o cuando otros bifosfonatos no son efectivos.
                1.4 Zoledronato (Reclast, Zometa): Tambien administrado por via intravenosa, es altamente eficaz y puede tener un efecto duradero con una sola dosis anual.

        2.- Calcitonina:

                Calcitonina de salmon (Miacalcin, Fortical): Una hormona que ayuda a regular los niveles de calcio y a inhibir la resorción ósea. Puede administrarse por inyeccion o aerosol nasal. Se usa menos frecuentemente debido a la mayor eficacia de los bifosfonatos.

        3.- Analgesicos:

                Acetaminofen (Tylenol): Para el manejo del dolor leve a moderado.
                INEs (antiinflamatorios no esteroideos): Como ibuprofeno (Advil, Motrin) o naproxeno (Aleve), para aliviar el dolor y la inflamacion.

        4.- Terapia con vitamina D y calcio:

                Suplementos de calcio y vitamina D: A menudo se recomiendan para asegurar una adecuada salud osea y prevenir deficiencias, especialmente en pacientes que toman bifosfonatos.
        '];
        X = dengue, R = ['te recomendaria para el Dengue:
        1.- Paracetamol (Acetaminofen):

            Utilizado para reducir la fiebre y aliviar el dolor. Es el medicamento de eleccion, ya que es seguro y efectivo.

        2.- Liquidos y electrolitos:

           Rehidratación oral: Soluciones de rehidratacion oral (SRO) para prevenir la deshidratacion.
           Liquidos intravenosos: En casos graves o cuando la deshidratacion es severa, se administran liquidos intravenosos en un hospital.

        3.- Reposo:

           Es fundamental para la recuperacion, permitiendo que el cuerpo se recupere de la infeccion.

        4.- Compresas frias:

           Para ayudar a reducir la fiebre.

        5.- Medicamentos y medidas a evitar:
           AINEs (Anti-inflamatorios no esteroideos):
           Ibuprofeno (Advil, Motrin) y aspirina (acido acetilsalicilico) deben evitarse, ya que pueden aumentar el riesgo de sangrado, una complicacion potencialmente grave en el dengue.

        6.- Corticosteroides:

           No se recomiendan ya que no han demostrado ser efectivos y pueden tener efectos adversos.
           Prevención de complicaciones:
           Monitorizacion regular:
           Es importante controlar la presion arterial, los niveles de plaquetas y otros parametros sanguineos para detectar signos tempranos de complicaciones, como el dengue grave (anteriormente conocido como dengue hemorragico).'];

        R = ['puede ser que', X, 'es una enfermedad pero no se que tratamiento darte']
    ).

tratamiento(X, R) :- \+ tratamientos(X), R = ['no se si', X, 'sea una enfermedad lo siento'].

%BASE_DE_TRATAMIENTOS
tratamientos(alzheimer).
tratamientos(oseo).
tratamientos(dengue).


%REGLAS_FAMILIA
familiar(X, R) :-
    familiares(X, Relacion, Y),
    (
        R = [X, 'es', Relacion, 'de', Y]
    ).

familiar(X, R) :- \+ familiares(X, _, _), R = ['No tengo informacion sobre', X].

familiares('jose Manuel', 'padre', 'Manuel A').
familiares('catalina', 'madre', 'Manuel').
familiares('Manuel', 'abuelo', 'Manuel A').
familiares('magdalena', 'abuela', 'Manuel').
familiares('simon', 'primo', 'manuel').
familiares('perla', 'prima', 'manuel').
familiares('rafael', 'tio', 'manuel').
familiares('leticia', 'tia', 'manuel').
familiares('estefani', 'hermana', 'manuel').
familiares('manuel', 'hijo', 'jose manuel').
familiares('manuel', 'hijo', 'catalina').
familiares('manuel', 'nieto', 'manuel A').
familiares('manuel', 'nieto', 'magdalena').
familiares('manuel', 'primo', 'marisol').
familiares('manuel', 'primo', 'Lilia').
familiares('manuel', 'sobrino', 'Angelica').
familiares('mannuel', 'sobrino', 'Lila').
familiares('manuel', 'hermano', 'estefani').


familiares('manuel A', 'padre', 'jose manuel').
familiares('magdalena', 'madre', 'jose manuel').
familiares('Esperanza', 'madre', 'catalina').
familiares('vernabe', 'padre', 'catalina').
familiares('leticia', 'hermana', 'jose manuel').
familiares('leticia', 'hija', 'manuel A').
familiares('leticia', 'hija', 'magdalena').
familiares('rafael', 'hermano', 'jose manuel').
familiares('rafael', 'hijo', 'manuel A').
familiares('rafael', 'hijo', 'magdalena').
familiares('Lila', 'hermana', 'jose manuel').
familiares('Lila', 'hija', 'manuel A').
familiares('Lila', 'hija', 'magdalena').
familiares('Angelica', 'hermana', 'jose manuel').
familiares('Angelica', 'hija', 'manuel A').
familiares('Angelica', 'hija', 'magdalena').
familiares('Dagoberto', 'hermano', 'jose manuel').
familiares('Dagoberto', 'hija', 'manuel A').
familiares('Dagoberto', 'hija', 'magdalena').
familiares('simon', 'nieto', 'manuel A').
familiares('perla', 'nieto', 'manuel A').
familiares('Lilia', 'nieta', 'manuel A').
familiares('marisol', 'nieta', 'manuel A').
familiares('simon', 'nieto', 'magdalena').
familiares('Lilia', 'nieta', 'magdalena').
familiares('marisol', 'nieta', 'magdalena').
familiares('jose manuel', 'hermano', 'leticia').
familiares('jose manuel', 'hermano', 'rafael').
familiares('jose manuel', 'hermano', 'Lila').
familiares('jose manuel', 'hermano', 'Angelica').
familiares('jose manuel', 'hermano', 'Dagoberto').

familiares('cuco', 'hermano', 'catalina').
familiares('lucia', 'hermana', 'catalina').
familiares('maria', 'hermana', 'catalina').
familiares('jose', 'hermana', 'catalina').
familiares('catalina', 'hija', 'vernabe').
familiares('catalina', 'hija', 'esperanza').
familiares('cuco', 'hijo', 'vernabe').
familiares('cuco', 'hijo', 'esperanza').
familiares('lucia', 'hija', 'vernabe').
familiares('lucia', 'hija', 'esperanza').
familiares('maria', 'hija', 'vernabe').
familiares('maria', 'hija', 'esperanza').
familiares('jose', 'hija', 'vernabe').
familiares('jose', 'hija', 'esperanza').
familiares('catalina', 'hermana', 'cuco').
familiares('catalina', 'hermana', 'lucia').
familiares('catalina', 'hermana', 'maria').
familiares('catalina', 'sobrina', 'jose').



familiares('estefani', 'hija', 'jose manuel').
familiares('estefani', 'hija', 'catalina').
familiares('estefani', 'nieta', 'manuel A').
familiares('estefani', 'nieta', 'magdalena').
familiares('estefani', 'nieta', 'vernnabe').
familiares('estefani', 'nieta', 'esperanza').
familiares('estefani', 'sobrina', 'Angelica').
familiares('estefani', 'sobrina', 'Lila').
familiares('estefani', 'sobrina', 'rafael').
familiares('estefani', 'sobrina', 'leticia').
familiares('estefani', 'sobrina', 'Dagoberto').
familiares('estefani', 'sobrina', 'cuco').
familiares('estefani', 'sobrina', 'lucia').
familiares('estefani', 'sobrina', 'maria').
familiares('estefani', 'sobrina', 'jose').


familiares('manuel', 'hijo', 'jose manuel').
familiares('manuel', 'hijo', 'catalina').
familiares('manuel', 'nieto', 'manuel A').
familiares('manuel', 'nieto', 'magdalena').
familiares('manuel', 'nieto', 'vernnabe').
familiares('manuel', 'nieto', 'esperanza').
familiares('manuel', 'sobrino', 'Angelica').
familiares('manuel', 'sobrino', 'Lila').
familiares('manuel', 'sobrino', 'rafael').
familiares('manuel', 'sobrino', 'leticia').
familiares('manuel', 'sobrino', 'Dagoberto').
familiares('manuel', 'sobrino', 'cuco').
familiares('manuel', 'sobrino', 'lucia').
familiares('manuel', 'sobrino', 'maria').
familiares('manuel', 'sobrino', 'jose').