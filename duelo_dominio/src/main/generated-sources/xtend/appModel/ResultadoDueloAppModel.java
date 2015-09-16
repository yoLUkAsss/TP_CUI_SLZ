package appModel;

import appModel.AnalizadorDeAtaque;
import appModel.DetalleJugadorDueloAppModel;
import java.util.Collection;
import jugador.EstadisticasPj;
import jugador.Jugador;
import jugador.Personaje;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class ResultadoDueloAppModel {
  private DetalleJugadorDueloAppModel rival;
  
  private DetalleJugadorDueloAppModel retador;
  
  private Jugador ganador;
  
  private Jugador perdedor;
  
  private Integer resultadoGanador;
  
  private Integer resultadoPerdedor;
  
  public ResultadoDueloAppModel(final DetalleJugadorDueloAppModel rival, final DetalleJugadorDueloAppModel retador) {
    this.rival = rival;
    this.retador = retador;
  }
  
  public Integer actualizarDatos() {
    Integer _xblockexpression = null;
    {
      AnalizadorDeAtaque analyzer = new AnalizadorDeAtaque();
      Jugador _jugador = this.retador.getJugador();
      Jugador _jugador_1 = this.rival.getJugador();
      Personaje _pj = this.retador.getPj();
      Personaje _pj_1 = this.rival.getPj();
      String _posElegida = this.retador.getPosElegida();
      String _posElegida_1 = this.rival.getPosElegida();
      int resultadoRival = analyzer.realizarDuelo(_jugador, _jugador_1, _pj, _pj_1, _posElegida, _posElegida_1);
      Jugador _jugador_2 = this.retador.getJugador();
      Collection<EstadisticasPj> _est = _jugador_2.getEst();
      final Function1<EstadisticasPj, Boolean> _function = new Function1<EstadisticasPj, Boolean>() {
        public Boolean apply(final EstadisticasPj esta) {
          String _nombre = esta.getNombre();
          Personaje _pj = ResultadoDueloAppModel.this.retador.getPj();
          String _nombre_1 = _pj.getNombre();
          return Boolean.valueOf(_nombre.equals(_nombre_1));
        }
      };
      EstadisticasPj estRetador = IterableExtensions.<EstadisticasPj>findFirst(_est, _function);
      Integer _xifexpression = null;
      Integer _calificacion = estRetador.getCalificacion();
      boolean _greaterThan = ((_calificacion).intValue() > resultadoRival);
      if (_greaterThan) {
        Integer _xblockexpression_1 = null;
        {
          Jugador _jugador_3 = this.retador.getJugador();
          this.ganador = _jugador_3;
          Jugador _jugador_4 = this.rival.getJugador();
          this.perdedor = _jugador_4;
          Integer _calificacion_1 = estRetador.getCalificacion();
          this.resultadoGanador = _calificacion_1;
          _xblockexpression_1 = this.resultadoPerdedor = Integer.valueOf(resultadoRival);
        }
        _xifexpression = _xblockexpression_1;
      } else {
        Integer _xifexpression_1 = null;
        Integer _calificacion_1 = estRetador.getCalificacion();
        boolean _lessThan = ((_calificacion_1).intValue() < resultadoRival);
        if (_lessThan) {
          Integer _xblockexpression_2 = null;
          {
            Jugador _jugador_3 = this.rival.getJugador();
            this.ganador = _jugador_3;
            Jugador _jugador_4 = this.retador.getJugador();
            this.perdedor = _jugador_4;
            Integer _calificacion_2 = estRetador.getCalificacion();
            this.resultadoPerdedor = _calificacion_2;
            _xblockexpression_2 = this.resultadoGanador = Integer.valueOf(resultadoRival);
          }
          _xifexpression_1 = _xblockexpression_2;
        }
        _xifexpression = _xifexpression_1;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
