var Ofrenda = React.createClass({
    render: function() {
        return (
            <div className="ofrenda">
                <div> {this.props.ofrenda.fecha} </div>
                <div class="monto"> {this.props.ofrenda.montoPesos} </div>
                <div class="monto"> {this.props.ofrenda.montoDolares} </div>
                <div> {this.props.ofrenda.icheque} </div>
                <div> {this.props.ofrenda.cuenta_id} </div>
                <div> {this.props.ofrenda.miembro_id} </div>
                <div> {this.props.ofrenda.comentario} </div>
            </div>
        );
    }
});
