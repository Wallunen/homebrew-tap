class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f31de5df253b3055d3d26940013c30ae4d9685ae9718afd373408adbe75329ed" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4cd808744b41514b3febd485f42fb9d56e27fc70c68174fa8cfc43e961d04da7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f59e34921b8b9ee70168a3b9e216de495f598888d018bd3260f05ff33d7631bc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3309+8f5f8090c.tar.xz"
  version "0.11.0-dev.3309+8f5f8090c"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
