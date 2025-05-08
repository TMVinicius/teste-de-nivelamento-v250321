from flask import Flask, request, jsonify
import MySQLdb  
from flask_cors import CORS

app = Flask(__name__)
CORS(app)


def get_db_connection():
    conn = MySQLdb.connect(
        host='localhost',  
        user="root",
        passwd="1234",
        db="db_cadastro_ans",
        port=3309  
    )
    return conn

@app.route('/pesquisar', methods=['GET'])
def search_operadoras():
    query = request.args.get('q', '')
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT cnpj, razao_social FROM tbl_empresas WHERE razao_social LIKE %s", (f"%{query}%",))
    results = cur.fetchall()
    cur.close()
    conn.close() 

    if not results:
            return jsonify({"message": "Nenhum resultado encontrado"}), 404
    
    return jsonify([{"cnpj": row[0], "razao_social": row[1]} for row in results])

@app.errorhandler(404)
def not_found(error):
    return jsonify({"error": "Rota não encontrada"}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
