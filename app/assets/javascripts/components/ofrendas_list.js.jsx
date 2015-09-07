var OfrendasList = React.createClass({
    getInitialState: function() {
        return { ofrendas: this.props.initialOfrendas };
    },

    render: function() {
        var ofrendas = this.state.ofrendas.map(function(ofrenda) {
            return <Ofrenda key={ofrenda.id} ofrenda={ofrenda} />;
        });

        return (
            <div className="ofrenda">
                {ofrendas}
            </div>
        );
    }
});
