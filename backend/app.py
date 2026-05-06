from flask import Flask, request, jsonify
from flask_cors import CORS
import psycopg2
import logging

app = Flask(__name__)
CORS(app)

# ---------------------------
# Logging
# ---------------------------
logging.basicConfig(level=logging.INFO)

# ---------------------------
# DB Connection
# ---------------------------
def get_db_connection():
    return psycopg2.connect(
        host="db",
        database="intermilan",
        user="mamr",
        password="123"
    )

# ---------------------------
# Helper: convert rows to JSON
# ---------------------------
def fetch_all_dict(cur):
    columns = [desc[0] for desc in cur.description]
    return [dict(zip(columns, row)) for row in cur.fetchall()]

# ---------------------------
# Health Check
# ---------------------------
@app.route('/health')
def health():
    return jsonify({"status": "ok"})

# ---------------------------
# Get players (optional team filter)
# ---------------------------
@app.route('/players', methods=['GET'])
def get_players():
    conn = None
    cur = None
    try:
        team = request.args.get('team')

        conn = get_db_connection()
        cur = conn.cursor()

        if team:
            app.logger.info(f"Filtering players by team: {team}")
            cur.execute("""
                SELECT player_name, team, kit_number, age
                FROM squad
                WHERE LOWER(TRIM(team)) = LOWER(TRIM(%s))
                ORDER BY kit_number;
            """, (team,))
        else:
            cur.execute("""
                SELECT player_name, team, kit_number, age
                FROM squad
                ORDER BY team, kit_number;
            """)

        data = fetch_all_dict(cur)
        return jsonify(data)

    except Exception as e:
        app.logger.error(str(e))
        return jsonify({"error": str(e)}), 500

    finally:
        if cur:
            cur.close()
        if conn:
            conn.close()

# ---------------------------
# Search by age or kit number
# ---------------------------
@app.route('/search', methods=['GET'])
def search():
    conn = None
    cur = None
    try:
        age = request.args.get('age')
        number = request.args.get('number')

        conn = get_db_connection()
        cur = conn.cursor()

        if age:
            app.logger.info(f"Search by age: {age}")
            cur.execute("""
                SELECT player_name, team, kit_number, age
                FROM squad
                WHERE age = %s;
            """, (age,))
        elif number:
            app.logger.info(f"Search by number: {number}")
            cur.execute("""
                SELECT player_name, team, kit_number, age
                FROM squad
                WHERE kit_number = %s;
            """, (number,))
        else:
            return jsonify({"error": "Provide age or number"}), 400

        data = fetch_all_dict(cur)
        return jsonify(data)

    except Exception as e:
        app.logger.error(str(e))
        return jsonify({"error": str(e)}), 500

    finally:
        if cur:
            cur.close()
        if conn:
            conn.close()

# ---------------------------
# Add new player
# ---------------------------
@app.route('/player', methods=['POST'])
def add_player():
    conn = None
    cur = None
    try:
        data = request.get_json()

        required = ["name", "number", "age", "team"]
        for field in required:
            if field not in data:
                return jsonify({"error": f"{field} is required"}), 400

        conn = get_db_connection()
        cur = conn.cursor()

        cur.execute("""
            INSERT INTO squad (player_name, kit_number, age, team)
            VALUES (%s, %s, %s, %s)
            RETURNING id;
        """, (
            data["name"],
            data["number"],
            data["age"],
            data["team"]
        ))

        new_id = cur.fetchone()[0]
        conn.commit()

        return jsonify({
            "message": "Player added successfully",
            "id": new_id
        }), 201

    except Exception as e:
        app.logger.error(str(e))
        return jsonify({"error": str(e)}), 500

    finally:
        if cur:
            cur.close()
        if conn:
            conn.close()

# ---------------------------
# List all teams
# ---------------------------
@app.route('/teams', methods=['GET'])
def get_teams():
    conn = None
    cur = None
    try:
        conn = get_db_connection()
        cur = conn.cursor()

        cur.execute("SELECT DISTINCT team FROM squad ORDER BY team;")
        data = fetch_all_dict(cur)

        return jsonify(data)

    except Exception as e:
        app.logger.error(str(e))
        return jsonify({"error": str(e)}), 500

    finally:
        if cur:
            cur.close()
        if conn:
            conn.close()

# ---------------------------
# Run App
# ---------------------------
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
