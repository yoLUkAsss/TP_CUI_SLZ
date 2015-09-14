package arena_dueloleyendas.dueloleyendas;

import appModel.DenunciaFacade;
import denuncias.Denuncia;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.PropertyAdapter;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.Selector;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.ListBuilder;
import org.uqbar.lacar.ui.model.bindings.Binding;

@SuppressWarnings("all")
public class CrearHacerDenunciaWindow extends SimpleWindow<DenunciaFacade> {
  public CrearHacerDenunciaWindow(final WindowOwner owner, final DenunciaFacade d) {
    super(owner, d);
    this.setTitle("Hacer denuncia");
    this.setTaskDescription("Hagan sus denuncias!!");
  }
  
  protected void addActions(final Panel mainPanel) {
    Button _button = new Button(mainPanel);
    final Procedure1<Button> _function = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Aceptar");
        it.setAsDefault();
        final Action _function = new Action() {
          public void execute() {
            DenunciaFacade _modelObject = CrearHacerDenunciaWindow.this.getModelObject();
            _modelObject.hacerDenuncia();
          }
        };
        it.onClick(_function);
        it.disableOnError();
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
    Button _button_1 = new Button(mainPanel);
    final Procedure1<Button> _function_1 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Cancelar");
        it.setAsDefault();
        final Action _function = new Action() {
          public void execute() {
            CrearHacerDenunciaWindow.this.close();
          }
        };
        it.onClick(_function);
        it.disableOnError();
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    final Panel editorPanel = new Panel(mainPanel);
    VerticalLayout _verticalLayout = new VerticalLayout();
    editorPanel.setLayout(_verticalLayout);
    final Panel panHor = new Panel(editorPanel);
    HorizontalLayout _horizontalLayout = new HorizontalLayout();
    panHor.setLayout(_horizontalLayout);
    Label _label = new Label(panHor);
    _label.setText("Motivo");
    Selector<Object> _selector = new Selector<Object>(panHor);
    final Procedure1<Selector<Object>> _function = new Procedure1<Selector<Object>>() {
      public void apply(final Selector<Object> it) {
        it.allowNull(false);
        Binding<?, Selector<Object>, ListBuilder<Object>> _bindItemsToProperty = it.bindItemsToProperty("motivosPosibles");
        PropertyAdapter _propertyAdapter = new PropertyAdapter(Denuncia.class, "motivo");
        _bindItemsToProperty.setAdapter(_propertyAdapter);
        it.<Object, ControlBuilder>bindValueToProperty("denuncia");
      }
    };
    ObjectExtensions.<Selector<Object>>operator_doubleArrow(_selector, _function);
    final Panel panHor2 = new Panel(editorPanel);
    HorizontalLayout _horizontalLayout_1 = new HorizontalLayout();
    panHor2.setLayout(_horizontalLayout_1);
    Label _label_1 = new Label(panHor2);
    _label_1.setText("Detalles");
    TextBox _textBox = new TextBox(panHor2);
    final Procedure1<TextBox> _function_1 = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        final Binding<Object, Control, ControlBuilder> bindingMonto = it.<Object, ControlBuilder>bindValueToProperty("denuncia.descripcion");
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function_1);
  }
}
