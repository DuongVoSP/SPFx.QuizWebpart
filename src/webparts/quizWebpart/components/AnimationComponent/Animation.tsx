import * as React from "react";
import styles from "./Animation.module.scss";
import { Dropdown, PrimaryButton, Stack, TextField } from "office-ui-fabric-react";
import { IScreen, UserData } from "../../../../models";
import { isNullOrEmpty, isValidEmail } from "../../../../misc/StringsExtension";
export interface IAnimationProps {}

const AnimationComponent = ({ onSubmit, onError }: IScreen) => {
  const canvasRef = React.useRef(null);
  let ctx;
  React.useEffect(() => {
    if (canvasRef && canvasRef.current) {
      canvasRef.current.width = 200;
      canvasRef.current.heigh = 200;

      ctx = (canvasRef.current as HTMLCanvasElement).getContext("2d");
    }
  }, [canvasRef]);

  const CANVAS_WIDTH = 200;
  const CANVAS_HEIGHT = 200;

  const playerImage = new Image();
  playerImage.src = require("../../assets/shadow_dog.png");
  const spriteWidth = 575;
  const spriteHeight = 523;
  let frameX = 0;
  let frameY = 8;
  let gameFrame = 0;
  const staggerFrames = 5;
  const spriteAnimations = [];
  const animationStates = [
    {
      name: "idle",
      frames: 7,
    },
    {
      name: "jump",
      frames: 7,
    },
    {
      name: "fall",
      frames: 7,
    },
    {
      name: "run",
      frames: 9,
    },
    {
      name: "dizzy",
      frames: 11,
    },
    {
      name: "sit",
      frames: 5,
    },
    {
      name: "roll",
      frames: 7,
    },
    {
      name: "bite",
      frames: 7,
    },
    {
      name: "ko",
      frames: 12,
    },
    {
      name: "getHit",
      frames: 4,
    },
  ];
  const [selectedState, setSelectedState] = React.useState("run");

  animationStates.forEach((state, index) => {
    let frames = { loc: [] };
    for (let j = 0; j < state.frames; j++) {
      let positionX = j * spriteWidth;
      let positionY = index * spriteHeight;
      frames.loc.push({ x: positionX, y: positionY });
    }
    spriteAnimations[state.name] = frames;
  });

  console.log(spriteAnimations);

  const [value, setValue] = React.useState("");
  const handleSubmit = () => {
    onSubmit(null);
  };
  let requestId;

  React.useEffect(() => {
    const canvas = canvasRef.current;
    const ctx = canvas.getContext("2d");
    let frameId;
    let start = null;

    const draw = (timestamp) => {
      if (!start) start = timestamp;
      const elapsed = timestamp - start;

      ctx.clearRect(0, 0, CANVAS_WIDTH, CANVAS_HEIGHT);
      let position = Math.floor(gameFrame / staggerFrames) % spriteAnimations[selectedState].loc.length;
      frameX = spriteWidth * position;
      frameY = spriteAnimations[selectedState].loc[position].y;
      ctx.drawImage(playerImage, frameX, frameY, spriteWidth, spriteHeight, 0, -10, Math.floor(spriteWidth / 3) - 10, Math.floor(spriteHeight / 3) - 20);

      gameFrame++;

      position = Math.floor(gameFrame / staggerFrames) % spriteAnimations[selectedState].loc.length;
      frameX = spriteWidth * position;
      frameY = spriteAnimations[selectedState].loc[position].y;

      frameId = requestAnimationFrame(draw);
    };
    frameId = requestAnimationFrame(draw);

    return () => cancelAnimationFrame(frameId);
  }, [selectedState]);

  return (
    <div>
      <div className={styles.control}>
        <label>Choose Animation</label>
        <Dropdown
          id="animation"
          options={animationStates.map((state) => {
            return { key: state.name, text: state.name };
          })}
          selectedKey={selectedState}
          onChange={(event, option) => {
            setSelectedState(option.key as string);
          }}
        />
      </div>
      <canvas ref={canvasRef} className={styles.canvas1}></canvas>
    </div>
  );
};

export default AnimationComponent;
