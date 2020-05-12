import * as Winston from 'winston'

const { LOG_LEVEL } = process.env

export default Winston.createLogger({
  level: LOG_LEVEL,
  format: Winston.format.json(),
  transports: [
    new Winston.transports.Console({ level: LOG_LEVEL })
  ]
})