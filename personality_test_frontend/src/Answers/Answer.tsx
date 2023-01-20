import { IAnswer } from '../types/data';
export const Answer = (props: IAnswer) => (
  <>
    <p>{props.content}</p>
    <p>{props.id}</p>
    <p>{props.score}</p>
  </>
)